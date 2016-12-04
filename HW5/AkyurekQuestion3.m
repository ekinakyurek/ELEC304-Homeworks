R = [28, 15+9i, 2+21i;15-9i, 48, 15-11i;2-21i,15+11i,30];
N=100000;
z = generaterandvec(N,R);

R2 = (z*z')/N;
percentage_error = ((R2-R)./R) * 100

%%Result
%My correlated random generator seems working fine.
%percantage_error =
% -0.2697 + 0.0000i   0.0634 - 0.1998i  -0.4479 - 0.1089i
%  0.0634 + 0.1998i  -0.5657 + 0.0000i  -0.9197 + 0.5152i
% -0.4479 + 0.1089i  -0.9197 - 0.5152i  -0.7302 + 0.0000i