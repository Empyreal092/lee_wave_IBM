clear all
close all

addpath(genpath('../'))

figure(99);
pplot(27,0.65)
subaxis(2,2,1); subaxis(2,2,2); subaxis(2,2,3); subaxis(2,2,4)
drawnow

v = VideoWriter('case_23.avi');
v.FrameRate = 10;
open(v);

%%
case_str = "ib2D_23";

load(case_str+"/"+case_str+"_init"+".mat")

for clock_i = 20:20:clockmax
    disp(clock_i);

    load(case_str+"/"+case_str+"_t"+clock_i+".mat","u","X","Point_rho","Xgg","t");
    
    plot_frame_23

    frame = getframe(gcf);
    writeVideo(v,frame);
end

close(v);