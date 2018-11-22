clc;
clear;

r =3;
nx = 50;

m = -r:r;
n = (r+1): (nx-r+1);

velx = zeros(49,1);
vely = zeros(49,1);


k = 1;


for i = 1:2*r+1
    for j = 1:2*r+1
        
            velx = zeros(49,1);
            vely = zeros(49,1);
        
            for im = 1:2*r+1
               for jm = 1:2*r+1
                    velx(k,1) = m(im) + n(i) ;
                    vely(k,1) = m(jm) + n(j);
                k = k+1;
                end
            end
            
        vel = horzcat(velx, vely);
    end
    
end
