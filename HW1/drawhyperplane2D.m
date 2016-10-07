%%This function plot hyperplane(line) of given a(column) and b(row) vector in 2D
function x2 = drawhyperplane2D(a,b)
%a1x1+a2x2 -a1b1-a2b2 = 0
%If we leave x2 alone: x2 = -a1/a2*x1 - transpose(a)*transpose(b)
%I defina m as coeff. of x1, n as the constant.
 m  = -a(1)/a(2);
 n = transpose(a)*transpose(b)/a(2);
 %I set the appropriate range
 x1 = -3:0.1:3;
 %Value of x2 for given x1 vector
 x2 = m*x1 +n;
 %Ploting the graph
 plot(x1,x2);
%Labeling the aces
 xlabel('x1')
 ylabel('x2')
 hold on
 %Ploting normal vector in b1,b2 point
 quiver(b(1),b(2),a(1),a(2));


 
          

 
 
