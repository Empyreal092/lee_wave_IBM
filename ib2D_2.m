% ib2D.m
% This script is the main program.
% clear all
% close all

%%

mkdir(mfilename)
addpath(genpath('SubRoutine'))

%%
if ~exist('t','var')
    initialize
    init_a
    t = 0;

    bouN = 0.12*1.5;

    %%
    disp("Re="+U_max*3*bump_h/mu)
    disp("Fr="+U_max*3/(bouN*bump_h))
else
    
end

for clock=1:clockmax
    t = t+dt;

    XX=X+(dt/2)*interp(u,X);
    
    ff=spread(Force(XX),XX);

    ff(:,:,1) = ff(:,:,1)+0.2*max(0,(U_max-mean(u(:)))); % force the mean flow

    [u,uu]=fluid(u,ff);
    X=X+dt*interp(uu,XX);

    X(Nb*2+1:length(X),1) = mod(X(Nb*2+1:length(X),1),L);

    if mod(clock,2*CFL_ratio) == 0
        F = scatteredInterpolant(X(Nb*2+1:length(X),1),X(Nb*2+1:length(X),2),Point_rho);
        Point_rho = F(Xgg(:,1),Xgg(:,2));

        X(Nb*2+1:length(X),:) = Xgg;
    end

    %%
    if clock == 1
        save(mfilename+"/"+mfilename+"_init"+".mat");
    end
    if rem(clock,20) == 0

        disp(clock+"; t="+t)
        save(mfilename+"/"+mfilename+"_t"+clock+".mat","u","X","Point_rho","Xgg","t")

        %animation:
        plot_frame
    end

    if rem(clock,1000) == 0
        save(mfilename+"/"+mfilename+"_full_t"+clock+".mat")
    end
end
save(mfilename+"/"+mfilename+"_final"+".mat")
