clear all
close all

addpath(genpath('../'))
%%
case_str = "ib2D_24";

load(case_str+"/"+case_str+"_init"+".mat")

for clock_i = 20:100:clockmax
    disp(clock_i);

    load(case_str+"/"+case_str+"_t"+clock_i+".mat","u","X","Point_rho","Xgg","t");
    
    plot_frame

end