clear;
lambda = 0.000632;

I0 = 10;
a=0.0004;
D = 1;

X= -10:0.01:10;
Y=-10:0.01:10;
[X1, Y1] = meshgrid(X,Y);
I=2 * I0 + 2 * I0 * cos(pi .* a .* (1 - 0.5 .* (X1.^2 + Y1.^2) ./ D^2) ./ lambda );

image(X,Y,I);
colormap(gray);
