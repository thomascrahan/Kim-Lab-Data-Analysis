% Program to color code FlyWire trackig data as scatter plot depending on presence/
% absence of channel 1 stimulus

%first manually import FlyWire trial .csv file including all standard selected columns

 
data = table2array(testdata); %type imported file name in parentheses
centroid_coord = [data(:,4),data(:,5)]; %column 3 should be centroid x, 4 should be centroid y
stim_status = (data(:,17)); %references data from channel 1

no_stim_x = [];
no_stim_y = [];
stim_x = [];
stim_y = [];
start_pt_x = centroid_coord(1,1);
start_pt_y = -centroid_coord(1,2);

for i = 1:length(stim_status)
    if stim_status(i) == 0
        no_stim_x(i) = centroid_coord(i,1);
        no_stim_y(i) = -centroid_coord(i,2);
    else
        stim_x(i) = centroid_coord(i,1);
        stim_y(i) = -centroid_coord(i,2);
    end
end

figure
scatter(no_stim_x,no_stim_y,1,[0.2,0.45,1])
hold on
scatter(stim_x,stim_y,7,"red","filled")
scatter(start_pt_x,start_pt_y,20,"yellow","filled")
title("Fly Navigation Path")
legend("stimulus off","stimulus on","start point")
hold off

%clearvars
