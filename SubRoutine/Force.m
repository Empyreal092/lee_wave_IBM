function F=Force(X)

global X_targ Point_rho Kt Nb H;

F(1:Nb*2,:) = -Kt*(X(1:Nb*2,:)-X_targ);

F(Nb*2+1:length(X),2) = Point_rho;
% F(Nb*2+1:length(X),2) = 0;