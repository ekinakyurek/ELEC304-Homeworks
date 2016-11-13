close all;
%define A vector given in the question
A = [0.01,0.001; 0.001, 0.01];
%defin x0 vector given in the question
x0 = [25;0];
%user given fx vector to calculate f(x0)
fx0 = transpose(x0)*A*x0;
%define given b vector according to question
b =  [x0 ; fx0(1,1) ];
%we already now gradient of transpose(x)AX 
%in question#6 I use that relation
gradf = (A+transpose(A)) * x0;
%I find a vector given in the question
normal =[gradf;-1];
%createing mash for plot
[X,Y] = meshgrid(-50:0.2:50);
%The mesh create 501x501 array we should fine f for each xypair in the
%array
Z = zeros(size(X));
 for i=1:size(X,1)
     for j=1:size(X,2)
         Z(i,j) =  transpose([X(i,j);Y(i,j)])*A*[X(i,j);Y(i,j)];
     end
 end
 %plot the array
mesh(X,Y,Z);   
%hold on for hyper plane
hold on;
%old hyperplane function
drawhyperplane3D(normal,b);