---
title: "修改火狐的账户服务器"
date: 2022-01-29 15:36:00 +0800
categories: ["闲笔"]
--- 

火狐浏览器是著名的历史悠久的开源浏览器，因此我在众多的安卓端浏览器中选择了它。然而，国内谋智的特供版使用起来又有诸多不便。若是选择国际版，则又丧失了方便同步这一大特点。因此，如果可以在选择国际版的同时将同步服务器修改至国内，就能获得两方面的便利了。

这里针对不同的浏览器版本给出不同的解决方案。

### Firefox Daylight

> [下载地址](https://github.com/mozilla-mobile/fenix/releases)

1. 打开设置 -> 关于 Firefox；
2. 连续点击 Firefox 图标，直至出现“已启用调试菜单”的Toast；
3. 返回主菜单，可以发现账户一栏出现了“自定义 Firefox 账户服务器”和“自定义同步服务器”两个选项；
4. 选择“自定义 Firefox 账户服务器”，输入 `https://accounts.firefox.com.cn`；
5. 等待应用自行重启；
6. 登录火狐通行证。

注意：已经登录的账户无法切换服务器，必须先退出登录

### Firefox Nightly

> [下载地址](https://firefox-ci-tc.services.mozilla.com/tasks/index/mobile.v2.fenix.nightly.latest)

Firefox Nightly 既可以使用以上方法修改账户服务器，也可以使用类似PC版的方法修改`aboug:config`或`pref.js`（可能需要root权限）或者安装插件。

具体要修改以下几项：
```
//同步到国内服务器
//50以上版本必须将https://accounts.firefox.com.cn加入webchannel.allowObject.urlWhitelist记得空格
user_pref("identity.fxaccounts.migrateToDevEdition", true);
user_pref("identity.fxaccounts.auth.uri", "https://api-accounts.firefox.com.cn/v1");
user_pref("identity.fxaccounts.remote.force_auth.uri", "https://accounts.firefox.com.cn/force_auth?service=sync&context=fx_desktop_v3");
user_pref("identity.fxaccounts.remote.oauth.uri", "https://oauth.firefox.com.cn/v1");
user_pref("identity.fxaccounts.remote.profile.uri", "https://profile.firefox.com.cn/v1");
user_pref("identity.fxaccounts.remote.signin.uri", "https://accounts.firefox.com.cn/signin?service=sync&context=fx_desktop_v3");
user_pref("identity.fxaccounts.remote.signup.uri", "https://accounts.firefox.com.cn/signup?service=sync&context=fx_desktop_v3");
user_pref("identity.fxaccounts.remote.webchannel.uri", "https://accounts.firefox.com.cn/");
user_pref("identity.fxaccounts.settings.uri", "https://accounts.firefox.com.cn/settings?service=sync&context=fx_desktop_v3");
user_pref("identity.sync.tokenserver.uri", "https://sync.firefox.com.cn/token/1.0/sync/1.5");
user_pref("services.sync.fxa.privacyURL", "https://accounts.firefox.com.cn/legal/privacy");
user_pref("services.sync.fxa.termsURL", "https://accounts.firefox.com.cn/legal/terms");
user_pref("services.sync.statusURL", "https://accounts.firefox.com.cn/status/"); 
```

---
附：其实 Mozilla 提供了搭建本地的同步和账户服务器的方法，如果有兴趣可以自行搭建一个。具体搜索 Firefox Sync 即可。

参考：
- [https://github.com/mozilla-mobile/fenix/issues/3762](https://github.com/mozilla-mobile/fenix/issues/3762)
- [https://www.firefox.net.cn/read-49572](https://www.firefox.net.cn/read-49572) (原帖已经无法访问)



