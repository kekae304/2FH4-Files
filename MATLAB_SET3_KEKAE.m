clc; % Clear the command line
clear; % Remove all previous variables

% Charges and positions
Q1 = 8e-9; % Charge at point (0, 1, 1)
Q2 = 8e-9; % Charge at point (0, -1, 1)
pL = 4e-9; % Charge density of the line (4 nC/m)

% Permittivity of free space
Epsilono = 8.8419e-12; % Permitivity of free space

% Observation point
P = [0, 0, 0]; % Coordinates of observation point

% Positions of the point charges
A = [0, 1, 1]; % Coordinates of Q1
B = [0, -1, 1]; % Coordinates of Q2

% Coordinates of the center of the line charge
C = [3.5, 3.5, 0]; % Assuming the line charge lies on the xy-plane, centered at the origin

% Number of steps for the line charge
Number_of_L_Steps = 100000;

R1 = P - A; % Vector from Charge 1 to Observation Point
R2 = P - B; % Vector from Charge 2 to Observation Point

R1Mag = norm(R1); % The magnitude of vector R1
R2Mag = norm(R2); % The magnitude of vector R2

E1 = Q1/(4*pi*Epsilono*R1Mag^3)*R1; % Electric field generated from Q1
E2 = Q2/(4*pi*Epsilono*R2Mag^3)*R2; % Electric field generated from Q2

% Calculate electric field due to the line charge
L = norm([7, 0, 0] - [0, 7, 0]); % Calculating the length of the line
dL_V = (L/Number_of_L_Steps)*[(-1/sqrt(2)), (1/(sqrt(2))), 0]; % Calculating the vector of a segment
dL=norm(dL_V); % Calculating the length of the segment 

EL = [0, 0, 0]; % Initializing the electric field generated from EL
SegmentC = (C-((Number_of_L_Steps/2)*dL_V-(dL_V/2))); % Determining the centre of the first segment

for i=1:Number_of_L_Steps
    R = P - SegmentC;                          % Vector from First Segment to Observation Point
    RMag = norm(R);                           % Calculating the magnitude of vector R 
    EL=EL+dL*pL/(4*pi*Epsilono*RMag^3)*R;   % Calculating the contribution from each segment 
    SegmentC = SegmentC + dL_V;               % Calculating the center of the ith segment
end

E = E1 + E2 + EL                             % Final calculation of the electric field at P
