function [array] = reform2d(u)
% Array values
array = u';
factor = 1;

s = size(array);
nx = s(1);
ny = s(2);
x = 1 : nx;
y = 1 : ny;
xnew = 0: (1/factor) : (nx-1);
ynew = 0:  (1/factor): (ny-1);
[A,B] = meshgrid(xnew,ynew);

% congridx = interp2(A,B)';
array = interp2(A,B)';