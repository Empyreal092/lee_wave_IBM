clear all
close all

%%
global H L Nx Nz dx dz
global Nb dxb

global ipx imx ipz imz;
global dt dxb;

global rho mu Kt;
global X_targ Point_rho;

%% grid info
% L = 50; Nx = 512;
% H = 30; Nz = 256;
L = 16*pi; Nx = 512;
H = 30; Nz = 256;
dx = L/Nx; dz = H/Nz;

ipx = [(2:Nx),1]; imx = [Nx,(1:(Nx-1))];
ipz = [(2:Nz),1]; imz = [Nz,(1:(Nz-1))];

Nb = ceil(pi*Nx);
dxb = L/Nb;

%% time info
U_max = 0.1;
% U_max = 0.16; % hydrolic jump like
CFL_ratio = 30;
tmax = 300;
dt = dx/U_max/CFL_ratio;
clockmax = ceil(tmax/dt);

%% physics info
Kt = 100; 
rho = 1;
mu = 2e-3; % kinematic visc: should be 1e-6
bouN = 0.12*1.5;

%% the bump
bump_wid = 2;
bump_h = 0.57*bump_wid/1.6;

for k=0:Nb-1
    dxb = L/Nb;
    X(k+1,1)=k*dxb;
    X(k+1,2)=bump_h*sin(X(k+1,1)/(8/5))+bump_h;

    X(k+Nb+1,1)=k*dxb;
    X(k+Nb+1,2)=0;
end

X_targ = X;

%% density points
% Xg = zeros(Nx,Nz,2);
% for i=0:(Nx-1)
%     for j=0:(Nz-1)
%         lg = L/Nx; hg = H/Nz;
%         Xg(i+1,j+1,1)=i*lg;
%         Xg(i+1,j+1,2)=j*hg;
%     end
% end

lg = L/Nx; hg = H/Nz;
[Xg(:,:,1),Xg(:,:,2)] = meshgrid([0:lg:L-lg],[0:hg:H-hg]);
Xgg = reshape(Xg,Nx*Nz,2);

Point_rho = -(H-Xgg(:,2))*bouN^2;

X = [X;Xgg];

%% velocity
u = zeros(Nx,Nz,2);

%%
[zgrid,xgrid] = meshgrid([0:Nz-1]*dz,[0:Nx-1]*dx);

% figure(123)
% pplot(12,0.5)
% 
% hold on
% heatmap2d(u(:,:,1),xgrid,zgrid)
% plot(X(1:Nb*2,1),X(1:Nb*2,2),'k.')
% % plot(X(:,1),X(:,2),'k.')
% axis([0,L,0,H])
% drawnow
% hold off

% figure(124)
% pplot(12,0.5)
% 
% figure(125)
% pplot(12,0.5)
