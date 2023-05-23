if ~exist('fg99')
    fg99 = figure(99);
    pplot(27,0.65)
%     fg99.WindowState = 'maximized';
end

% bump_h = bump_h*2;
% sgtitle("$\mbox{Re}="+max(abs(u(:,20:end,2)),[],'all')*bump_h/mu+...
%     "; \mbox{Fr}="+mean(abs(u(:,20:end,2)),'all')/(bouN*bump_h)+"; t="+t+"$")
sgtitle("$\mbox{Re}="+max(abs(u(:,20:end,2)),[],'all')*bump_h/mu+...
    "; \mbox{Fr}="+mean(abs(u(:,20:end,2)),'all')/(bouN*bump_h)+"; t="+t+"$")

%%
subaxis(2,2,1,'ML',0.05,'MR',0.05,'MT',0.12,'MB',0.1,'SV',0.15,'SH',0.06);
heatmap2d(u(:,:,1),xgrid,zgrid); hold on
plot(X(1:Nb*2,1),X(1:Nb*2,2),'k.')
axis([0,L,-1e-2*H,H])
valmax = max(abs(u(:,:,1)),[],'all')+0.01;
cmocean('speed')
clim([0 0.3]); colorbar

title("$u$")
axis equal

hold off

%%
subaxis(2,2,2)
heatmap2d((u(:,:,2)),xgrid,zgrid); hold on
plot(X(1:Nb*2,1),X(1:Nb*2,2),'k.')
axis([0,L,-1e-2,H])

valmax = 0.08;
cmocean('balanced')
clim([-valmax valmax]); colorbar

title("$w$")
axis equal

hold off

%%
subaxis(2,2,3)
vorticity=(u(ipx,:,2)-u(imx,:,2))/dx  -(u(:,ipz,1)-u(:,imz,1))/dz;

heatmap2d(vorticity,xgrid,zgrid); hold on
plot(X(1:Nb*2,1),X(1:Nb*2,2),'k.')
axis([0,L,-1e-2,H])

valmax = 1.5;
cmocean('curl')
clim([-valmax valmax]); colorbar

title("$\omega$")
axis equal

hold off


%%
subaxis(2,2,4)
F = scatteredInterpolant(X(Nb*2+1:length(X),1),X(Nb*2+1:length(X),2),Point_rho);
Point_rhoplot = F(Xg(:,:,1),Xg(:,:,2));
contourf(Xg(:,:,1) , Xg(:,:,2) , Point_rhoplot, 13); hold on
% contourf(reshape(X(Nb*2+1:length(X),1),Nx,Nz) , reshape(X(Nb*2+1:length(X),2),Nx,Nz) , reshape(Point_rho,Nx,Nz), 13)
plot(X(1:Nb*2,1),X(1:Nb*2,2),'k.');

cmocean('-dense'); 
clim([-0.22 0]); colorbar
title("$b$")
axis equal

hold off

drawnow

%%
pplot(27,0.65)
% savefig("../figs/ib2D_10_t"+clock)
