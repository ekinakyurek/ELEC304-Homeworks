%Cholesky Decompostion
%It returns a lower triangular matrix such A = LL' for a positive definite matrix.
function L = cholesky(A)
n = size(A,1);
L = zeros(size(A));

for i=1:n
    if i==1
        L(i,i) = sqrt( A(i,i));
    else
        L(i,i) = sqrt( A(i,i) - sum( L(i,1:i-1).^2) )  ;
    end

    for j= i+1:n
        if i == 1
            L(j,1) = A(j,1)/L(i,i);
        else
           L(j,i) = ( A(j,i) - sum(L(j,1:i-1).*L(i,1:i-1))) / L(i,i);
        end  
    end
    

end

end