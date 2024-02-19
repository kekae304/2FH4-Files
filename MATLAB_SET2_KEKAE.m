clc; %clearing command line 
clear; %removing previous variables

V = 0; %initializing volume to 0 
S1 = 0; %initializing area of S1 to 0 
S2 = 0; %initializing area of S2 to 0 
S3 = 0; %initializing area of S3 to 0 
S4 = 0; %initializing area of S4 to 0 
S5 = 0; %initializing area of S5 to 0 
S6 = 0; %initializing area of S6 to 0  

rad = 0; %initializing r to lower bound
phi = pi/4; %initializing phi to lower bound
theta = pi/4; %initialzing theta to lower bound 

Number_of_rad_Steps = 1000; %initializing the discretization
Number_of_phi_Steps = 1000; %initializing the discretization
Number_of_theta_Steps = 1000; %initializing the discretization

drad = (2-0) / Number_of_rad_Steps; %the rad increment
dphi = (pi/2 - pi/4) / Number_of_phi_Steps; %the phi increment 
dtheta = (pi/2 - pi/4) / Number_of_theta_Steps; %the theta increment 

%calculting the the volume of the enclosed surface
for k=1:Number_of_theta_Steps
    for j=1:Number_of_rad_Steps
        for i=1:Number_of_phi_Steps
            V = V + ((rad^2)*sin(theta)*drad*dtheta*dphi); %adding contribution to the volume
        end 
        rad = rad + drad; 
    end 
    rad = 0; %reset to lower bound
    theta = theta + dtheta;
end 

%calculating the area of S1 and S2 
rad1 = 0; %rad for S1
rad2 = 2; %rad for S2
for k=1:Number_of_phi_Steps
    for i=1:Number_of_theta_Steps
        S1 = S1+(rad1^2)*sin(theta)*dphi*dtheta; %contribution to area of S1 
        S2 = S2+(rad2^2)*sin(theta)*dphi*dtheta; %contribution to area of S2 
    end 
    theta = theta + dtheta; 
end
%calculating the area of S3 and S4
rad = 0; %reset to lower bound 
theta1 = pi/4;
theta2 = pi/2; 
for j=1:Number_of_rad_Steps
    for i=1:Number_of_phi_Steps 
        S3 = S3 + rad*sin(theta1)*dphi*drad; %contribution to area of S3 
        S4 = S4 + rad*sin(theta2)*dphi*drad; %contribution to area of S4 
    end
     rad = rad+drad; 
end
%calculating the area of S5 and S6 
rad = 0; 
for k=1:Number_of_theta_Steps
    for j=1:Number_of_rad_Steps
        S5 = S5 + rad*drad*dtheta; %contribution to area of S5 
    end
    rad = rad+drad;
end

S6 = S5; %area of S6 = area of S5
S = S1+S2+S3+S4+S5+S6; %sum of all areas which is the area of the enclosed surface
   