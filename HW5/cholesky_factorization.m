%Cholesky Decompostion
%It returns a lower triangular matrix such A = LL' for a positive definite matrix.
function L = cholesky_factorization(A)
[L_temp,D]  = ldlt_factorization(A);
inverse_condition = diag(D) <= 0;
%Check if diagonals are positive
    if sum(inverse_condition) == 0
        L = L_temp;
    else
        error('It is not a positive definite matrix')
    end
end
