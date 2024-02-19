clc; %clearing the command line
clear; %removing all of the previous variables

R1 = [1 2 3]; %declaring point R1
R2 = [3 2 1]; %declaring R2

R1_DOT_R2 = dot(R1, R2); %dot product of R1 and R1 
R2_DOT_R2 = dot(R2, R2); %dot product of R2 and R2


PROJ_R1_ON_R2 = (R1_DOT_R2/R2_DOT_R2)*R2; %projection of R1 on R2

MAG_R1 = norm(R1); %magnitude of R1 
MAG_R2 = norm(R2); %magnitude of R2 

COS_THETA = R1_DOT_R2 / (MAG_R1 * MAG_R2); %cosine value of the angle between R1 and R2
THETA = acos (COS_THETA); %the angle between R1 and R2 

disp("A) " + R1_DOT_R2); %displaying the dot product of R1 and R2
disp("B) " + PROJ_R1_ON_R2(1) + " " + PROJ_R1_ON_R2(2) + " " + PROJ_R1_ON_R2(3)); %displaying the projection of R1 on R2
disp("C) " + THETA + " radians"); %displaying the angle between R1 and R2

