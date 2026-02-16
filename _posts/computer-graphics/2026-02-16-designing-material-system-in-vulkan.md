---
title: "为 Vulkan 设计材质系统"
categories: ["计算机图形学"]
---

这篇文章中，我将简单说明我本人在 Vulkan 中设计渲染引擎的材质系统时遭遇的问题和提出的解决方案，作为记录以供参考。

## 材质系统的需求

材质系统几乎是任何图形渲染引擎都不可避免的系统，而且是其中最复杂、细节最多、牵涉组件最广的系统之一，对实时渲染系统而言更是如此。
为了设计这个系统，必须先弄清楚这个系统到底需要完成什么工作，也就是这个系统的需求是什么。
我把这个系统的需求分为两个部分：面向用户的需求，也就是要提供哪些接口、实现哪些功能（大概也叫功能性需求）；以及面向底层的需求，也就是要使用哪些 Vulkan API、这些 API 各有什么限制（大概也叫设计约束）。

### 功能需求

为了研究功能需求，不妨调查一下市面上已经实现的各类渲染引擎的材质系统各自提供什么接口。
我把市面上可见的实时渲染使用的材质系统大概分成几类：
1. 不提供对于图形管线和着色器的灵活操作能力，而是通过提供固定的材质和参数（例如 PBR 管线和贴图）以供用户定制。比如 Bethesda 随游戏分发的 Creation Kit。
2. 提供定制着色器的能力，但是只允许在一定限度上进行定制，例如使用 Shader Graph 限制可使用的操作或者固定着色器的接口。
虽然能定制管线中运行的程序，但是无法定制管线本身，一般固定使用延迟着色（deferred shading）或集群前向着色（clustered forward shading）。
大部分游戏引擎都采用这种方式，典型的例子有 [Unreal](https://dev.epicgames.com/documentation/zh-cn/unreal-engine/unreal-engine-materials)、[Source](https://developer.valvesoftware.com/wiki/Zh/Shader) 和 [Godot](https://docs.godotengine.org/zh-cn/4.x/engine_details/architecture/internal_rendering_architecture.html) 等引擎。
1. 提供对管线的完全定制能力，允许自由撰写着色器并控制包括剔除、深度测试等管线参数，也允许定制管线本身，包括控制渲染通道、自由使用计算着色器等。
Unity 引擎的[可编程渲染管线](https://docs.unity3d.com/cn/current/Manual/com.unity.render-pipelines.core.html)系统采用的就是这种设计。

大部分游戏引擎都使用第二种设计，这不是没有原因的。
首先，游戏中玩家遇到的物件绝大部分确实都使用同一个管线。
帕累托法则说明，80% 的物体仅仅使用了 20% 的渲染管线，而剩下 80% 的管线中，像 GUI 或者屏幕空间后处理等特殊的管线又占据了很大一部分。
因此，没有必要提供过多的无用的定制能力。
其次，提前确定管线对优化是非常有利的。
固定的管线、执行顺序和内存依赖意味着不管是游戏开发者、引擎开发者还是硬件开发者都能进行最大限度的优化，尽可能地榨取性能。
最后，显然，需求越简单，实现和维护就越简单。

我个人决定采用第三种设计方法，主观上因为这种设计更难、实现起来更有趣、能学到更多 Vulkan 相关的方法论，客观上则因为这种设计更适合需要高度定制化的实验性项目或工具，且便于未来扩展到计算着色器、光线追踪等。

为完成材质系统的设计，我们首先研究一下材质到底应该具有哪些内容。
瑞士计算机科学家尼克劳斯·维尔特指出：
> 算法 ＋ 数据结构 ＝ 程序

在我看来，材质系统就是对 GPU 上运行的程序的抽象，因此也具有两个部分：
1. 算法：在 GPU 上执行的程序。以图形学术语来说，就是管线。包括固定函数部分和可编程部分。对材质系统，这意味着我们要实现控制管线的这两个部分的能力，也就是定制深度测试等固定函数部分和上传着色器的能力。
2. 数据结构：上传到 GPU 的数据。在 Vulkan 中，最主要的数据结构是描述子集合（Descriptor set），用来对数据进行索引。这意味着材质系统需要设计将 GPU 资源绑定到管线上的机制。

Unity 的材质系统设计也大概采用了这种分野。算法部分由`Shader`资产通过`ShaderLab`语言指定；数据结构部分由`Material`资产说明。
在我们的引擎的设计中，前者被叫做`MaterialTemplate`，后者被叫做`MaterialInstance`。

这些都是上层的需求设计，具体而言，我们希望材质系统能够：
- 指定管线参数，既包括混合、剔除、深度偏移、深度测试等固定函数参数，也能指定使用什么着色器。这些参数一经指定就不能修改。
- 指定材质参数，包括材质贴图、颜色、金属度等参数，这些参数可能在运行时改变。
- 提供一个区分机制，从而实现按名字或者按标签调用。例如，在前向着色中，我们希望先调用生成阴影贴图（Shadowmap）的管线、然后再调用进行着色的管线。

### 设计约束

与材质系统交互的 Vulkan API 中最主要者就是`VkPipeline`了。
这个对象提供了对 GPU 上运行的任何程序的封装。
对图像管线，其创建极为复杂，API 参数主要包括以下内容：
```c
typedef struct VkGraphicsPipelineCreateInfo {
    VkStructureType                                  sType;
    const void*                                      pNext;
    VkPipelineCreateFlags                            flags;
    uint32_t                                         stageCount;
    const VkPipelineShaderStageCreateInfo*           pStages;
    const VkPipelineVertexInputStateCreateInfo*      pVertexInputState;
    const VkPipelineInputAssemblyStateCreateInfo*    pInputAssemblyState;
    const VkPipelineTessellationStateCreateInfo*     pTessellationState;
    const VkPipelineViewportStateCreateInfo*         pViewportState;
    const VkPipelineRasterizationStateCreateInfo*    pRasterizationState;
    const VkPipelineMultisampleStateCreateInfo*      pMultisampleState;
    const VkPipelineDepthStencilStateCreateInfo*     pDepthStencilState;
    const VkPipelineColorBlendStateCreateInfo*       pColorBlendState;
    const VkPipelineDynamicStateCreateInfo*          pDynamicState;
    VkPipelineLayout                                 layout;
    VkRenderPass                                     renderPass;
    uint32_t                                         subpass;
    VkPipeline                                       basePipelineHandle;
    int32_t                                          basePipelineIndex;
} VkGraphicsPipelineCreateInfo;
```

我们逐一讲解其中的参数含义：
1. `pStages`：着色器程序。
2. `pVertexInputState`：顶点输入状态，即用于绘制的顶点缓冲区的内容要如何解释。
3. `pInputAssemblyState`：输入组装器状态，说明输入的数据要被如何组装为何种图元。
4. `pTessellationState`：曲面细分状态，说明曲面细分及其着色器相关的操作。
5. `pViewportState`：视口状态，指定视口变换相关操作。
6. `pRasterizationState`：光栅化器状态，指定表面剔除、是否填充多边形等光栅化相关内容。
7. `pMultisampleState`：多重采样状态，说明是否进行多重采样。
8. `pDepthStencilState`：深度模板状态，控制深度测试和模板测试相关的内容。
9. `pColorBlendState`：颜色混合状态，指定颜色混合以及写入相关操作。
10. `pDynamicState`：动态状态，指定上述状态中，哪些可以在运行时动态地指定，而不必在此结构体中指定。不是所有状态都能动态指定的，使用前需先检查硬件支持情况。
11. `layout`：管线布局，即这个管线要使用哪些描述子。
12. `renderPass`、`subpass`：渲染通道。Vulkan 1.4 中已弃用，现在应使用动态渲染（dynamic rendering）。

能够发现，其中的大部分参数都是前面提到的管线参数，也就是在创建时就能确定的参数，这些参数处理起来就比较简单。
但是，有一些参数比较特别，主要是`pVertexInputState`和`pViewportState`这两个。
这两个参数只有在运行时才能确定。
由于网格体具有不同的顶点数据，顶点输入状态只有在开始绘制之前才能确定，而视口数据和窗口有关。
这些只有在绘制前才能确定的数据，使得在 Vulkan（以及 Direct12）中提前编译管线非常困难，这也是现代游戏帧率不稳定的罪魁祸首之一。

对于视口参数，解决方式非常简单。Vulkan 标准要求所有驱动程序必须支持动态指定这个参数，因此我们只需要设置`pDynamicState`即可。
对于顶点输入，这种方式就不太可行了。
动态指定顶点输入需要启用`VK_EXT_vertex_input_dynamic_state`扩展，这个扩展的支持还不是很好。
我们考虑了下面几种解决方法：
- 在`MaterialTemplate`中指定这个材质支持哪些顶点输入。这种方式不会引入管线编译导致的卡顿，但是非常笨重且容易出错。
- 要求引擎只提供一种统一的网格体顶点格式。所有其他顶点格式都会被转换到这种格式。显然，这会浪费大量的内存。如果启用`VK_EXT_robustness2::nullDescriptor`这个设备特征，则可以降低内存浪费，但这个扩展的支持也不是很好。
- 延迟管线的创建，直到所有运行时信息都能确定。这种方法扩展性和健壮性最强，如果使用这种方法，甚至其他参数也能在运行时修改。但是，这会导致编译管线时帧延迟急剧上升。

我们决定和现有的大部分游戏引擎一样，采取第三种方式。
为了缓解管线编译问题，我们可以提供“预热”的接口，提前创建一些管线。
Unity 提供了一套自动刨析系统，可以记录运行时编译的所有管线数据，然后在打包时提前编译这些管线，这一思路值得借鉴。

## 材质系统设计

说明了材质系统的需求之后，我们在这一节中将说明材质系统的 API 设计。
按照上文所说的三个具体需求，我们设计了三个类来完成这些需求。

### MaterialTemplate 类

如上文所述，`MaterialTemplate`类负责管线的参数。
这个类实现了对单个`VkPipeline`对象的封装。

```cpp
struct MaterialTemplate {
    vk::UniquePipeline pipeline_;
    vk::DescriptorSetLayout desc_layout_;
    vk::PipelineLayout pipeline_layout_;

    /**
     * @brief 创建并编译管线。
     *
     * @param asset 该材质的资产，包括管线参数。
     * @param mri 该材质的运行时数据，即只有绘制时才能确定的参数。
     */
    MaterialTemplate(
        MaterialTemplateAsset asset,
        MaterialRuntimeInfo mri
    );
};
```

我们的渲染系统的描述子集合是按使用频率分配的，零号集合放置整帧共用的资源，包括场景设计，一号集合放置此相机使用的资源，以此类推。
因此，每个材质本身只具有一个描述符布局，其他布局是通过场景数据等确定的。
这个描述符布局是通过反射着色器取得的。
这两个布局成员最好通过每种机制缓存起来，以避免重复创建。

该类具有一个资产，资产中存放可序列化的数据，也就是上文中提到的各种管线参数。
```cpp
struct MaterialTemplateAsset {
    std::vector <Shader>    shaders_;
    InputAssemblyInfo       input_assembly_;
    /* ...... */
};
```
这些数据可以被序列化到磁盘上，作为资产来管理。

其中使用的运行时数据如下：
```cpp
struct MaterialRuntimeInfo {
    vk::PipelineVertexInputStateCreateInfo vertex_input_state;
    /* ...... */
};
```
这个结构体具有散列函数，以供散列表查询使用。

### MaterialInstance 类

`MaterialInstance`类负责提供着色器资源的绑定，其接口设计如下：

```cpp
struct MaterialInstance {
    vk::DescriptorSet set_;

    std::unordered_map <
        uint32_t,
        std::variant <
            std::monostate,
            vk::ImageView,
            vk::Buffer
        >
    > resources_;

    MaterialInstance(vk::DescriptorSet set);

    void BindImageView(uint32_t slot, vk::ImageView image) noexcept;
    void BindBuffer(uint32_t slot, vk::Buffer buffer) noexcept;

    void WriteDescriptorSet();
};
```

这个类本身的设计比较简单，但是如果需要考虑别的需求，那么复杂度就会极大提高：
 - 修改使用中的描述子集合。如果一个描述子集合已经被绑定在命令缓冲区中，甚至已经被 GPU 上使用了，那么除非启用特定的拓展，否则修改这个描述子集合就会发生错误。这可通过使用多个描述符池等方法解决。
 - 简单变量支持。我们希望能够直接修改一些简单的变量，比如 GLSL 类型为标量的变量或者`vec3`这种简单的矢量。为实现这种需求，这个类需要自行管理一个统一缓冲区（Uniform Buffer），并且实现该缓冲区的自动分配和同步。
 - 按名称设置变量。我们希望可以按名称选择变量。变量的名称可通过着色器反射获得，但是对不同的着色器，同一名称的变量可能位于不同的位置，这就需要从`MaterialTemplate`获得变量信息。如果和上一个简单变量叠加，这意味着我们还需要处理变量的内存布局问题。
 - 描述子集合的解分配。Vulkan 推荐不进行描述子集合的解分配。这种情况下，如果描述子池被填满了，就必须申请新的描述子池。这就需要和其他渲染系统的组件协作。

实现这些需求最简单的方法就是按描述子集合的内容进行缓冲，从而避免修改和解分配问题。
但是，采取何种缓冲又是一个问题。
如果散列表，那么设计针对内容的散列函数也是一大问题。
对于统一缓冲区的同步，也可使用环形缓冲区来规避这一问题，参考[Diligent 引擎的实现](https://diligentgraphics.com/2016/04/20/implementing-dynamic-resources-with-direct3d12/)。

### MaterialLibrary 类

上文提到，我们需要一个区分机制来按某种标签选择管线。
同时，我们也需要管理运行时数据和`MaterialTemplate`的映射，从而避免反复创建管线。
这些职责由`MaterialLibrary`类承担。

```cpp
struct MaterialLibrary {
    using PipelineCache = std::unordered_map<
        MaterialRuntimeInfo,
        std::unique_ptr<MaterialTemplate>
    >;

    struct PipelineBundle {
        PipelineCache cache;
        vk::UniquePipelineLayout layout;
        vk::UniqueDescriptorSetLayout material_set_layout;
    };

    std::unordered_map <std::string, PipelineBundle> pipelines_;
    std::unordered_map <std::string, MaterialTemplateAsset> assets_;

    MaterialLibrary(
        std::unordered_map <std::string, MaterialTemplateAsset> assets
    );

    vk::Pipeline GetPipeline(
        std::string_view tag,
        const MaterialRuntimeInfo & visci
    );
};
```

这个类比较简单，就是在`GetPipeline()`调用时通过`tag`和其他运行时数据进行查找，如果没有查找到就调用`MaterialTemplate`的构造函数进行构造。

如果使用`VK_KHR_pipeline_library`和`VK_EXT_graphics_pipeline_library`拓展，那么管线库也可保存在这个类当中，进一步优化管线编译。
