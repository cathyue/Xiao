clear all; clc;
lam = 700e-9;
N = 8;
dphi = 2*pi/N;
theta = pi/2;
dx = lam/(N*sin(theta));
y = 5*lam;
x = lam;
n = 20;
deltx = dx/n;
nx = x/deltx;
ny = round(y/deltx);
E = zeros(nx, ny);
dist = 0;

for klam = -7:7
    for k = 1:N
        for kx = 1:nx
            for ky = 1:ny
                dist = sqrt(((kx-1)*deltx-(nx-1)*deltx/2-(k*dx-(N+1)/2*dx+klam*lam/sin(theta))).^2+...
                    ((ky-1)*deltx+deltx/2).^2);
                E(kx,ky) = E(kx,ky)+sin(dist*2*pi/lam-k*2*pi/N)./dist;
            end
        end
    end
end

E(:,1:100) = zeros(nx,100);
E = E./max(max(abs(E)));

figure;surf( [1:nx].*deltx-(nx+1).*deltx./2 , [0:ny-1].*deltx, E.', 'linestyle', 'none');
view(2);axis equal;
