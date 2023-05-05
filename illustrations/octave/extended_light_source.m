clear;
lambda = 632e-9;
D = 5;
D_1 = 5;
a = 1e-5;
n = 1;

x = -1:0.01:1;
b = 0:0.001:0.5;
[X,B] = meshgrid(x,b);
SINCX = 2 .* pi ./ lambda .* n .* a .* B ./ D_1;
SINC = sin(SINCX) ./ SINCX;

I = 50 .* (1 .+ SINC .* cos(2 .* pi ./ lambda .* n .* a .* X ./ D));
image(I');
%surf(X,B,I);
colormap(gray);
