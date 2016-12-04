%Q4d
%Defining given numbers in the question
number_of_rows = 200;
n = 1000;
non_zero_row_number = 20;
max_number_of_rows = 300;
min_number_of_rows = 2;
%error data and number of rows
y = zeros(max_number_of_rows-min_number_of_rows+1);
x = min_number_of_rows:max_number_of_rows;
for number_of_rows=min_number_of_rows:max_number_of_rows
    %intialize the error
    error = 0 ;
    for i=1:10
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
        error  = error + norm(x-z, 2)/norm(z,2);
    end
    %average the error and save it to y
        error = error/10;
        y(number_of_rows-min_number_of_rows+1) = error;
end
%plot
plot(x,y)