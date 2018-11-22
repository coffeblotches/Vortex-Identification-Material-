%% Vector Field
a = -1; b = 1; n = 50; %Bounds for points of vector field
Vx = (b-a).*rand(n, n) + a; %X-axis
Vy = (b-a).*rand(n,n) + a;  %Y-axis
[x1,x2] = meshgrid(Vx,Vy);  %2-D grid for the coordinates of X-axis and Y-axis

%% Vortex
m = randi(5);
for k = 1:10
i = randi(n);
j = randi(n);
r = -j : 0.15 : j;
[x,y] = meshgrid(r);
rr = x.^2+y.^2;
hold on 
%quiver(Vx, Vy); %Vector Field
quiver(x+i,y+j, -y./rr.*(1-exp(-rr)) , x./rr.*(1-exp(-rr)) , "b" ) ;
% axis([-(i+j) i+j -(i+j) i+j]);
axis([0 n 0 n]);
axis equal ;
hold off
end

%% IDENTIFICATION
