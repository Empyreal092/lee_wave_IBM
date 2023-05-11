function U=interp(u,X)
global Nx Nz dx dz

U=zeros(length(X),2);
for k=1:length(X)
  s(1)=X(k,1)/dx;
  s(2)=X(k,2)/dz;

  i=floor(s);
  r=s-i;
  i1=mod((i(1)-1):(i(1)+2),Nx)+1;
  i2=mod((i(2)-1):(i(2)+2),Nz)+1;
  
  w=phi1(r(1)).*phi2(r(2));
  U(k,1)=sum(sum(w.*u(i1,i2,1)));
  U(k,2)=sum(sum(w.*u(i1,i2,2)));
end

