clc; % Clear the command line
clear; % Remove all previous variables

% Parameters of the Toroid
I = 5.0; % Given Current
NumberOfTurns = 200; % Number of Turns
InnerRadius = 0.015; % Inner Radius
OuterRadius = 0.025; % Outer Radius

% Parameters of the Plane
XPoints = 20; % Number of X Points 
YPoints = 20; % Number of Y Points 
XLower = -0.04; % Lower X Boundary
XUpper = 0.04; % Upper X Boundary
YLower = -0.04; % Lower Y Boundary
YUpper = 0.04; % Upper Y Boundary

DX = (XUpper - XLower)/(XPoints-1); % Size of X Steps
DY = (YUpper - YLower)/(YPoints-1); % Size of Y Steps
[X, Y] = meshgrid(XLower:DX:XUpper, YLower:DY:YUpper); 

% Magnetic Field Calculations
BX = zeros(XPoints, YPoints);
BY = zeros(XPoints, YPoints);

for i = 1:XPoints
    for j = 1:YPoints

    x = X(i,j); 
    y = Y(i,j); 
    R = sqrt(x^2 + y^2); 
    
    if R < InnerRadius || R > OuterRadius
        continue;
    end

    P = atan2(y, x); 
    BPhi = (I*NumberOfTurns)/(2*pi*R); 
    BX(i,j) = -BPhi * sin(P); 
    BY(i,j) = BPhi * cos(P); 
        
    end
end

% Generating The Plot 
quiver(X, Y, BX, BY);
xlabel('x (m)');
ylabel('y (m)'); 
title('Magnetic Field of Toroid');