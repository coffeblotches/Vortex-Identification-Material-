function [vx, vy] = lambOseen
%clc; clear;
%pyversion /usr/bin/python3.6 /usr/bin/python3

%% Initials
vmax = 2;
rmax = 50;
ratio_vradial = 0;
alpha = 1.256;

%% rcore
rcore = rmax / alpha^0.5;

%% gamma , rmax , vmax , vcore 
gamma = 2*pi*vmax*rmax*(1+1/(2*alpha));

if (gamma ~=	 0) && (rcore ~=	 0)
    rmax = rcore*alpha^0.5;
    vmax = gamma/(2*pi*rmax*(1+1/(2*alpha)));
    vcore = (1 - exp(-1))*gamma/(2*pi*rcore);
else
    disp('Error');
end

%% Range (Input these values)
x = zeros(200,200);
y = zeros(200,200);
for i = 1:200
       x(i,:) = -100:99 ;
       y(:,i) = -100:99;
end
xx = x; yy = y;

%% vradial & vtheta
r = radius(x,y);
%r = r + 1^(-10);
vtheta = gamma.*(1 - exp(-r.^2)./(rcore^2))./(2*pi.*r);
vradial = vtheta .* ratio_vradial;

%% Vx and Vy at point (x,y)
vector = [(0 - vtheta ).* yy + (vradial .* xx); (vtheta .* xx) + (vradial .* yy) ];
vx = vector(1:200,:)./r;
vy = vector(201:400,:)./r;
figure(1)
quiver(x, y, vx, vy);

disp(rcore);
disp(vcore);
end