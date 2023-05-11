%init_a.m
%This script initializes the array  a
%that is used in the fluid solver

global a;

%%
a=zeros(Nx,Nz,2,2);

%%
a(:,:,1,1)=1;
a(:,:,2,2)=1;

%%
for mx=0:(Nx-1)
    for mz=0:(Nz-1)
        if~(((mx==0)|(mx==Nx/2))&((mz==0)|(mz==Nz/2)))
            t=(2*pi)*[mx/Nx;mz/Nz];
            s=sin(t);
            ss=(s*s')/(s'*s);
            a(mx+1,mz+1,1,1)=a(mx+1,mz+1,1,1)-ss(1,1);
            a(mx+1,mz+1,1,2)=a(mx+1,mz+1,1,2)-ss(1,2);
            a(mx+1,mz+1,2,1)=a(mx+1,mz+1,2,1)-ss(2,1);
            a(mx+1,mz+1,2,2)=a(mx+1,mz+1,2,2)-ss(2,2);
        end
    end
end

for mx=0:(Nx-1)
    for mz=0:(Nz-1)
        t=(pi)*[mx/Nx;mz/Nz];
        s=sin(t);
        a(mx+1,mz+1,:,:)=a(mx+1,mz+1,:,:)...
            /(1+(dt/2)*(mu/rho)*(4/(dx*dz))*(s'*s));
    end
end

