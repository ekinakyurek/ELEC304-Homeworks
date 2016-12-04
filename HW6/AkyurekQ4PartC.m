%Q4c
%Defining given numbers in the question
number_of_rows = 200;
n = 1000;
non_zero_row_number = 20;

%Creating random gaussian observation matrix
A = randn(number_of_rows,n);
%I permute indexes and select first 980 of shuffled index as zero elements
indexes = randperm(n)';
zero_indexes = indexes(1:n-non_zero_row_number);
%Select last 20 shuffled index as non zero
non_zero_indexes = indexes(n-non_zero_row_number+1:n);

z = zeros(n,1);
%Assignin 20 random element
z(non_zero_indexes) = randn(1,non_zero_row_number);
%Finding b vector
b = A*z;

%Optimization begins
cvx_begin
variable x(n)
%minimize one norm
minimize( norm( x , 1 ) )
subject to
%hold the equality
    A* x == b;
cvx_end
error  = norm(x-z, 2)/norm(z,2);
subplot(2,1,1);
stem(x,'Color',[.6 0 0]); title('X');
subplot(2,1,2);
stem(z); title('Z'); 

 
 %error : 5.322135801075306e-09