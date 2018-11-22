function [F,V] = vertices(gamma1, nx)
%load gamma1.mat

y = zeros(nx,1);
x = zeros(1,nx);

for i = 1:nx
    x(i,:) = gamma1(i,:);
    y(:,i) = gamma1(:,i);    
end
[F,V] = poly2fv({x(5,5:196),x(196,5:196)},{y(5,5:196),y(196,5:196)});
end
