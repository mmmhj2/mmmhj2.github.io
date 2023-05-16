clear;
hold off;
% 光的波长和波数，以及谱线宽度
lambda = 632e-9;
sigma = 1 / lambda;
delta_sigma = sigma / 10;

% 仪器配置
a = 0.05;   % 两孔间距
D = 1;      % 孔到光屏的距离

% 计算相位差
delta_x = 30 * lambda * D / a;          % 绘制二十个条纹
x = linspace(-delta_x, delta_x, 8000);
delta = a .* x ./ D;

%plot(1 + cos(2 .* pi ./ lambda .* delta))

% 计算辛格函数
SIN = pi .* delta_sigma .* delta;
SINC = sin(SIN) ./ SIN;
intensity = SINC .* cos(2 .* pi .* sigma .* delta);

subplot(2,1,1);
plot(intensity);
hold on;
plot(SINC, 'r--');
plot(-SINC, 'r--');

subplot(2,1,2);
image(x, delta_x, (intensity+1) .* 50);
colormap(gray)
