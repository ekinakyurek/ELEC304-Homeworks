close all;
A = [0.01,0.001; 0.001, 0.01];
x0 = [25;0];
fx0 = transpose(x0)*A*x0;
b =  [x0 ; fx0(1,1) ];
gradf = (A+transpose(A)) * x0;
normal =[gradf;-1];

[X,Y] = meshgrid(-50:0.2:50);
Z = zeros(501,501);
 for i=1:501
     for j=1:501
         Z(i,j) =  transpose([X(i,j);Y(i,j)])*A*[X(i,j);Y(i,j)];
     end
 end
mesh(X,Y,Z);      
hold on;
drawhyperplane3D(normal,b);