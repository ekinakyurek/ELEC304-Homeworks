%%This function plots hyperplane of given a(column )and b(column) vectors in 3D.
function x3 = drawhyperplane3D(a,b)
%a1x1 + a2x2 + a3x3 - a1b1 - a2b2 - a3b4 = 0
%If we leave x3 alone: x3 = -a1/a3*x1-a2/a3*x2+transpose(a)*transpose(b)/a3
% I define coeff. of x1 as 'm1', coeff. of x2 as 'm2', the constant as 'n'
n = transpose(a)*b/a(3);
m1 = -a(1)/a(3);
m2 = -a(2)/a(3);
%The plot 3D graph I generated the mesh in a enough range of X and Y
[x1,x2] = meshgrid(b(1)-20:0.5:b(1)+20, b(2)-20:0.5:b(2)+20);
%I calculated the x3 values for given XY mesh.
x3 =  m1*x1 + m2*x2+ n ; 
%Ploting the function
surf(x1,x2,x3);
%Labeling axes
xlabel('x1')
ylabel('x2')
zlabel('x3')
hold on
%I plot the normal vector in b1,b2,b3 point, and largen a bit.
quiver3( b(1),b(2),b(3),a(1),a(2),a(3),2, 'linewidth', 3, 'MaxHeadSize', 0.6, 'color', 'red');
%Appropriate view angle is set
view(62,20)