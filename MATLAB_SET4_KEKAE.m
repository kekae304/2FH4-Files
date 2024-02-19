clc; % Clear the command line
clear; % Remove all previous variables

Epsilono = 8.854e-12; % Use permittivity of air
D = 2e-6; % Surface charge density
P = [0 0 1]; % Position of the observation point
E = zeros(1,3); % Initialize E = (0, 0, 0)

Number_of_rho_Steps = 100; % Initialize discretization in the rho direction
Number_of_phi_Steps = 100; % Initialize discretization in the phi direction

RhoLower = 0; % Lower boundary of rho
RhoUpper = 1; % Upper boundary of rho
PhiLower = 0; % Lower boundary of phi
PhiUpper = 2*pi; % Upper boundary of phi

DRho = (RhoUpper - RhoLower) / Number_of_rho_Steps; % Size of each Rho step
DPhi = (PhiUpper - PhiLower) / Number_of_phi_Steps; % Size of each Phi step

ds = DRho * DPhi; % Calculating Area
dQ = D * ds; % Calculating Charge of Area 

for j = 1:Number_of_phi_Steps
    for i = 1:Number_of_rho_Steps
        rho = RhoLower + DRho/2 + (i-1) * DRho; % Rho component of the center of a grid
        phi = PhiLower + DPhi/2 + (j-1) * DPhi; % Phi component of the center of a grid
        R = P - [rho * cos(phi), rho * sin(phi), 0]; % Vector from Center of the Grid to Observation Point
        RMag = norm(R); 
        ds = DRho * rho * DPhi; 
        dQ = D * ds;
        E = E + (dQ / (4 * pi * Epsilono * RMag^3)) * R; % Contribution to the electric field
    end
end

E
