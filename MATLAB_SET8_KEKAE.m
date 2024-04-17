clc; % Clear the command line
clear; % Remove all previous variables

Epsilono = 8.854e-12; % Use permittivity of air
D = 2e-6; % Surface charge density

RLower = 2; % Lower boundary of R
RUpper = 3; % Upper boundary of R
ThetaLower = 0; % Lower boundary of Theta
ThetaUpper = pi; % Upper boundary of Theta
PhiLower = 0; % Lower boundary of Phi
PhiUpper = 2*pi; % Upper boundary of Phi

WE = 0; % Initializing WE 

Number_of_R_Steps = 1000; % Initialize discretization in the R direction
Number_of_Phi_Steps = 1000; % Initialize discretization in the Phi direction
Number_of_Theta_Steps = 1000; % Initialize discretization in the Theta direction

DR = (RUpper - RLower) / Number_of_R_Steps; % Size of each R step
DPhi = (PhiUpper - PhiLower) / Number_of_Phi_Steps; % Size of each Phi step
DTheta = (ThetaUpper - ThetaLower) / Number_of_Theta_Steps; % Size of each Theta step

% Calculating the energy: 
for i = 1:Number_of_Theta_Steps
    for j = 1:Number_of_Phi_Steps
        for k = 1:Number_of_R_Steps
            R = 2 + 0.5 * DR + (i - 1) * DR;
            Theta = 0.5 * DTheta + (j - 1) * DTheta;
            Phi = 0.5 * DPhi + (k - 1) * DPhi;
            E = D / (Epsilono * (R^2));
            DV = R^2 * sin(Theta) * DR * DPhi * DTheta;
            DWE = 0.5 * Epsilono * E^2 * DV;
            WE = WE + DWE;
        end
    end
end

WE