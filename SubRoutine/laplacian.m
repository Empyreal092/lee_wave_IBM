function w=laplacian(u)
global ipx imx ipz imz;
global dx dz

w=(u(ipx,:,:)+u(imx,:,:)-2*u)/(dx^2) + (u(:,ipz,:)+u(:,imz,:)-2*u)/(dz^2);

% im = [N,1:(N-1)] = circular version of i-1
% ip = [2:N,1]     = circular version of i+1
% N  = number of points in each space direction

