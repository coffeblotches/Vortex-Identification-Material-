function [X,Y,u,v] = generate_vortex(nx,ny)
strength = 5;
xc = 0; yc = 0;
x_start = -2;
x_end = 2;
y_start = -2;
y_end = 2;

x = linspace(x_start, x_end, nx);
y = linspace(y_start, y_end, ny);
 
[X,Y] = meshgrid(x,y);
u = strength./(2*pi).*(Y-yc)./((X-xc).^2+(Y-yc).^2);
v = -strength./(2*pi).*(X-xc)./((X-xc).^2+(Y-yc).^2);

u_inf = 2;
alpha = 0;
[u1,alpha1] = freestream(u_inf,alpha);

u = u + u1 * X * cos(alpha1);
v = v + u1 * Y * sin(alpha1);