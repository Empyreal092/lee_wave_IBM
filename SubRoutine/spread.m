function f=spread(F,X)
global dx dz Nx Nz dxb Nb;

%% for the bump
c=dxb/(dx*dz);
f=zeros(Nx,Nz,2);

for k=1:Nb*2
    s(1)=X(k,1)/dx; s(2)=X(k,2)/dz;
    i=floor(s);
    r=s-i;

    i1=mod((i(1)-1):(i(1)+2),Nx)+1;
    i2=mod((i(2)-1):(i(2)+2),Nz)+1;
    w=phi1(r(1)).*phi2(r(2));
    f(i1,i2,1)=f(i1,i2,1)+(c*F(k,1))*w;
    f(i1,i2,2)=f(i1,i2,2)+(c*F(k,2))*w;
end

c=(dx*dz)/(dx*dz);
for k=Nb*2+1:length(X)
    s(1)=X(k,1)/dx; s(2)=X(k,2)/dz;
    i=floor(s);
    r=s-i;

    i1=mod((i(1)-1):(i(1)+2),Nx)+1;
    i2=mod((i(2)-1):(i(2)+2),Nz)+1;
    w=phi1(r(1)).*phi2(r(2));
    f(i1,i2,1)=f(i1,i2,1)+(c*F(k,1))*w;
    f(i1,i2,2)=f(i1,i2,2)+(c*F(k,2))*w;
end

