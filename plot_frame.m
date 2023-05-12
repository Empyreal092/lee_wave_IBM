if ~exist('fg99')
    fg99 = figure(99);
    fg99.WindowState = 'maximized';
end

sgtitle("$\mbox{Re}="+max(abs(u(:,:,2)),[],'all')*bump_h/mu+...
    "; \mbox{Fr}="+max(abs(u(:,:,2)),[],'all')/(bouN*bump_h)+"; t="+t+"$")

%%
subaxis(2,2,1,'ML',0.05,'MR',0.05,'MT',0.12,'MB',0.1,'SV',0.15,'SH',0.06);
heatmap2d(u(:,:,1),xgrid,zgrid); hold on
plot(X(1:Nb*2,1),X(1:Nb*2,2),'k.')
axis([0,L,-1e-2*H,H])
valmax = max(abs(u(:,:,1)),[],'all')+0.01;
cmocean('speed')
clim([0 valmax]); colorbar

title("$u$")

hold off

%%
subaxis(2,2,2)
heatmap2d((u(:,:,2)),xgrid,zgrid); hold on
plot(X(1:Nb*2,1),X(1:Nb*2,2),'k.')
axis([0,L,-1e-2,H])

valmax = max(abs(u(:,:,2)),[],'all')+0.01;
cmocean('balanced')
clim([-valmax valmax]); colorbar

title("$w$")

hold off

%%
subaxis(2,2,3)
vorticity=(u(ipx,:,2)-u(imx,:,2))/dx  -(u(:,ipz,1)-u(:,imz,1))/dz;

heatmap2d(vorticity,xgrid,zgrid); hold on
plot(X(1:Nb*2,1),X(1:Nb*2,2),'k.')
axis([0,L,-1e-2,H])

valmax = max(abs(vorticity),[],'all')+0.01;
cmocean('curl')
clim([-valmax valmax]); colorbar

title("$\omega$")

hold off


%%
subaxis(2,2,4)
F = scatteredInterpolant(X(Nb*2+1:length(X),1),X(Nb*2+1:length(X),2),Point_rho);
Point_rhoplot = F(Xg(:,:,1),Xg(:,:,2));
contourf(Xg(:,:,1) , Xg(:,:,2) , Point_rhoplot, 13); hold on
% contourf(reshape(X(Nb*2+1:length(X),1),Nx,Nz) , reshape(X(Nb*2+1:length(X),2),Nx,Nz) , reshape(Point_rho,Nx,Nz), 13)
plot(X(1:Nb*2,1),X(1:Nb*2,2),'k.');

cmocean('-dense'); colorbar
title("$b$")

hold off

drawnow