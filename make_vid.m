clear all
close all

%%
case_str = "ib2D_1";

load(case_str+"/"+case_str+"_init"+".mat")

for clock_i = 20:20:clockmax
    load(case_str+"/"+case_str+"_t"+clock_i+".mat","u","X","Point_rho","Xgg","t");
    
    plot_frame

end