close all;
%Creating mesh from given range
[X1,X2] = meshgrid(-2:0.1:2,-2:0.1:2);
%Calculation function values
f = (4*X1.^2-1).*exp(-X1.^2-X2.^2);
%Plotting mesh with transparency of alpha =0.2 and with yellow color code=[1 1 0]
mesh(X1,X2,f, 'FaceAlpha', 0.2, 'FaceColor', [1 1 0]);
hold on;
%
%I pick (-1, 0.5)
p1 = -1;
p2 = 0.5;
%Creating mesh points with a adaptive range
[ax1,ax2] = meshgrid(p1-0.2:0.01:p1+0.2,p2-0.2:0.01:p2+0.2);
%Value of the function at p1,p2
foo = (4*p1^2-1)*exp(-p1.^2-p2.^2);
%Gradient at p1,p2
gradf = [(10-8*p1^2)*p1*exp(-p1^2-p2^2);-2*p2*(4*p1^2-1)*exp(-p1^2-p2^2)];
%Hessian at p1,p2
H = [ (10-44*p1^2+16*p1^4)*exp(- p1^2 - p2^2), -2*p1*p2*(10 - 8*p1^2)*exp(- p1^2 - p2^2); -2*p1*p2*(10 - 8*p1^2)*exp(- p1^2 - p2^2), (4*p2^2-2)*(4*p1^2-1)*exp(- p1^2 - p2^2)];
%Quadratic approximation values
fq2 = foo + gradf(1)*(ax1-p1) + gradf(2)*(ax2-p2) +1/2* ( H(1,1)*(ax1-p1).^2 + 2*H(1,2) *(ax1-p1).*(ax2-p2) + H(2,2)*(ax2-p2).^2);
%Plotting approximation
surf(ax1,ax2,fq2,'FaceColor', [1 0 0])
hold on;
%Indication p1,p2 point
plot3(p1,p2,foo,'o','markerfacecolor','green','markersize',10);