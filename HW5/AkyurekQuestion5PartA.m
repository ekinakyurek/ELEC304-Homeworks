close all;
ax = axes('XLim',[-1.5 1.5],'YLim',[-1.5 1.5],'ZLim',[0 1.5]);
view(3)
h = hgtransform('Parent',ax);
hold on;

[X1,Y1] = meshgrid(0:0.01:1.5, -1.5:0.01:1.5);
Z1 = sqrt((1/7 + X1.^2/1+Y1.^2/1));
mesh(X1,  Y1,  Z1,'Parent',h, 'FaceColor', [1,0,0]);

hold on;
[X2,Y2] = meshgrid(-1.5:0.01:0, -1.5:0.01:1.5);
Z2 = sqrt((1/7 + X2.^2/1+Y2.^2/1));
mesh(X2,  Y2 , Z2,'Parent',h, 'FaceColor', [1,1,0]);

hold on;
[X3,Y3,Z3] = cylinder(0.4);
Z3 = Z3 *0.5;
mesh(X3,  Y3 , Z3,'Parent',h, 'FaceColor', [1,1,1]);

%// Optional: Interpolate the color and do not show the grid line
%// Optional: Set the aspect ratio of the axes to 1:1:1 so proportions
%//           are displayed correctly.
%axis manual;

% 
% foo = -1;
% %gradf = [0;0];
% %H = [10 0; 0 , 2];
% %Creating mesh points with a smaller range than that of our function
% [ax1,ax2] = meshgrid(-0.5:0.01:0.5,-0.5:0.01:0.5);
% %Calculating quadratic function values
% fq =  foo + 5*ax1.^2+ax2.^2;
% %Plotting mesh with a red color code.
% surf(ax1,ax2,fq,'FaceColor', [1 0 0])
% axis manual;
% hold on;
% 

for r = 1:.1:6*pi
    % Z-axis rotation matrix
    Rz = makehgtform('zrotate',r);
    % Scaling matrix
    % Concatenate the transforms and
    % set the transform Matrix property
    set(h,'Matrix',Rz)
    drawnow
end
pause(1)