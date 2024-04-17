clc; % Clear the command line
clear; % Remove all previous 

V_Out = 0; % Outer Conductor Voltage
V_In= 100; % Inner Conductor Voltage
 
XPoints = 50; % Number of X Points 
YPoints = 50; % Number of Y Points 
Unknowns = XPoints * YPoints; % Number of Unknowns

MatrixOne = zeros(Unknowns, Unknowns); % Creating Matrix -> Unknowns x Unknowns
MatrixTwo = zeros(Unknowns, 1); % Creating Matrix -> Unknowns x 1

iLine = XPoints / 2;
jLine = YPoints / 2; 

i=1; % Counting number of equations

for j = 1:XPoints
    for k = 1:YPoints

        %First Set of Conditions
        if (j == iLine && k >= jLine)
            MatrixOne(i, i) = 1;
            MatrixTwo(i, 1) = V_In;  

        elseif ((j < iLine || j > iLine) && k == YPoints)
            MatrixOne(i, i) = 1;
            MatrixTwo(i, 1) = 50; 

        else
            MatrixOne(i, i) = -4;
            
            %Second Set of Conditions
            if (k == 1) 
                MatrixTwo(i, 1) = MatrixTwo(i, 1) - V_Out; 
            
            else
                MatrixOne(i, i - 1) = 1.0;     
            end
            
            %Third Set of Conditions
            if (k == YPoints)
                MatrixTwo(i, 1) = MatrixTwo(i, 1) - 50;
            
            else 
                MatrixOne(i, i + 1) = 1.0;
            end
            
            %Fourth Set of Conditions
            if (j == 1) 
                MatrixTwo(i, 1) = MatrixTwo(i, 1) - V_Out;
            
            else
                MatrixOne(i, i - XPoints) = 1;
            end
            
            %Fifth Set of Conditions
            if (j == XPoints) 
                MatrixTwo(i, 1) = MatrixTwo(i, 1) - V_Out;
            
            else
                MatrixOne(i, i + XPoints) = 1.0;
            end
        end
        i = i + 1;
    end
end

V = MatrixOne \ MatrixTwo; % Vector Voltages

VSquare = reshape(V, XPoints, YPoints); % Getting Rectangular Matrix

colormap(jet);

surf(VSquare);

figure;

[C,h] = contour(VSquare);

set(h, 'ShowText', 'on', 'TextStep', get(h, 'LevelStep') * 2)

colormap summer;

figure;

contour(VSquare);

[px,py] = gradient(VSquare);

hold on, quiver(-px, -py), hold off 

colormap summer;