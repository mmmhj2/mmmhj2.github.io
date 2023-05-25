clear;
lambda_1 = 589.0e-9;
lambda_2 = 589.6e-9;
e = 1.25e-2;             % 干涉仪厚度
d = 5e1;               % 至光屏的距离
R = 0.8;              % 反射系数

axes_dim = linspace(-1, 1, 1000);
[X,Y] = meshgrid(axes_dim, axes_dim);
R = sqrt(X.^2 + Y.^2);
I = atan2(R, d);
COSI = cos(I);

PHI1 = 4 .* pi .* e .* COSI ./ lambda_1;
PHI2 = 4 .* pi .* e .* COSI ./ lambda_2;
E1 = 1 ./ (1 + 4 .* R ./ (1 - R).^2 .* (sin(PHI1 ./ 2).^2));
E2 = 1 ./ (1 + 4 .* R ./ (1 - R).^2 .* (sin(PHI2 ./ 2).^2));
[ind, map] = rgb2ind(E1, E2, zeros(1000,1000));
colormap(map);
image(ind);
