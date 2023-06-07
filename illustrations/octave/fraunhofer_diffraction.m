clc; clear;
L = 10e-7;
l = 5e-7;
lambda = 400e-9;
f = 0.5;

X = linspace(-1, 1, 1000);
Y = linspace(-1, 1, 1000);
[X, Y] = meshgrid(X, Y);

SINCX = l .* X ./ lambda ./ f;
SINCX = sinc(SINCX);
SINCY = L .* Y ./ lambda ./ f;
SINCY = sinc(SINCY);
E = (SINCX.^2) .* (SINCY.^2);

%surf(E, X, Y);
image(5000*E);
colormap(hot);
daspect([1 1]);
