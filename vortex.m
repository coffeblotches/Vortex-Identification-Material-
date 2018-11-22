% Detection based on Graftieaux at al. 2001
% Identification of vortex
clc;
clear;
nx = 50; 
ny = 50;

%% reform2d and LambOseen
[X,Y,u,v] = generate_vortex(nx,ny);       
%[vx, vy] = lambOseen;


%% Gamma values
r = 5; 
r = round(r);
neighbour = -r:r;
factor = 1;
vx = u'; vy = v';


pm1 = zeros((2*r+1)^2,1);
k = 1; j = 1;
for i = 1:(2*r+1)
    for o = 1:(2*r+1)
    pm1(k,1) = neighbour(j);
    k = k+1; 
    end
    j = j+1;
end

pm2 = zeros((2*r+1)^2,1);
k = 1;
for i = 1:(2*r+1)
    for j = 1:(2*r+1)
    pm2(k,:) = neighbour(j);
    k = k + 1;
    end
end

pm = horzcat(pm1,pm2);
pnorm = vecnorm(pm')';
N = (2 * r + 1) ^ 2;


% % % FLCT data for Gamma values
% load vx.mat;
% load vy.mat;

gamma1 = zeros(size(vx));
gamma2 = zeros(size(vx));

m = -r:r;
n = (r+1): (nx-r+1);

velx = zeros(((2*r+1)^2),1);
vely = zeros(((2*r+1)^2),1);

k2 = 1;
% for i = 1:((2*r+1)^2) - (r+2)
%     for j = 1:((2*r+1)^2) - (r+2)
for i = 1:length(n) -1
    for j = 1:length(n) -1       
        
            velx = zeros(49,1);
            vely = zeros(49,1);
            
            k1 = 1; 
            
            for im = 1:2*r+1
               for jm = 1:2*r+1
                    velx(k1,1) = vx(m(im) + n(i), m(jm) + n(j)); 
                    vely(k1,1) = vy(m(im) + n(i), m(jm) + n(j)); 
                k1 = k1+1;
                end
            end
        %Gamma 1    
        vel = horzcat(velx, vely);
        cross_product = cross([pm zeros(size(pm,1),1)],[vel zeros(size(vel,1),1)]);
        cross_product = cross_product(:,3);
        angle(:,k2) = cross_product./(pnorm .* vecnorm(vel')' + exp(-10));
        gamma1(n(i),n(j)) = nansum(angle(:,k2))/N;
    
        %Gamma 2
        vel2 = vel - mean(vel);
        cross_product2 = cross([pm zeros(size(pm,1),1)],[vel2 zeros(size(vel2,1),1)]);
        cross_product2 = cross_product2(:,3);
        angle2(:,k2) = cross_product2./(pnorm .* vecnorm(vel2')' + exp(-10));
        gamma2(n(i),n(j)) = nansum(angle2(:,k2))/N;
        
        k2 = k2 +1;
        
    end
    
end

% Plot
figure(1)
[X,Y] = meshgrid(1:nx,1:ny);
plot3(X,Y,gamma2);
surface(X,Y,gamma2);
surf(X,Y,gamma2);
     
%% Points in polygon

levels = [-2/pi, 2/pi];
figure(2)
[C,h] = contour3(gamma2, levels); 
x = C(1,:); y = C(2,:);
[F,V] = poly2fv(x,y); %Vertices of Contour of Gamma1
V = round(V);

x = V(:,1); y = V(:,2);

inPoints = polygrid(x, y, 5);
plot(inPoints(:, 1),inPoints(:,2), '.k');

%% Identified Parameters

points = round(inPoints);
p1 = points(:,1); 
p2 = points(:,2);
[m,n] = size(points);

for i = 1:m
dust(i,:) = gamma1(p1(i), p2(i));
end

format short


if length(dust) >1
    re = sqrt(size(points)/pi)/factor;
else
    print("Length of dust error");
    
end

para = find(dust == max(dust));
edge = V/factor
center = points(para, :)
radius = re(1)
peak = dust(para)

%% Exapanding speed, Rotational Speed, center point Velocity
[m,n] = size(center);

for i = 1:n
    
    
    
end




