%%Convex Cone
% density
n=.01;
% create coordinates
[xx,yy,zz] = meshgrid( -1:n:1, -1:n:1,-1:n:1);

% boundary condition 1
rr = xx.*zz - yy.^2;
%boudary condition 2
rr2 = xx + zz;

region3 = rr>=0 & rr2>=0;

p=patch(isosurface(region3,0.5));
set(p,'FaceColor','red','EdgeColor','none');
view(3); axis equal
camlight 
lighting gouraud
grid on


