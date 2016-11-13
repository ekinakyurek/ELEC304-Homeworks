%Recursive LDL' decomposition
%It returns L, D, P such that:
%P*A*P'=L*D*L'
%D is the diagonal matrix with signs of the eigen values
%P is the permutation matrix
%L is the lower triangular matrix.
function [L,D,P] = recursive_cholesky(A)
if A == A'
    threshold =10e-12;
    n = size(A,1);

    if size(A,1) == 1
            L = [sqrt(A)];
        if abs(A(1,1)) < threshold
            D = [0];
        else 
            D = [A/abs(A)];
        end
            P = [1];
    else 
        i = 0;
        P = eye(size(A));
        alpha = A(1,1);
        all_diagonals_is_zero = false;
        while abs(alpha) < threshold && i<n
            C = P;
            P(1,:) = P(end-i,:);
            P(end-i,:) = C(1,:);
            A =P*A*P';
            alpha = A(1,1);
            i=i+1;
        end
      display(alpha)
      display(i)
        if  abs(alpha) <  threshold && i==n
                all_diagonals_is_zero = true;
        end

        if ~all_diagonals_is_zero 
            [L_below, D_below, P_below] =  recursive_cholesky(A(2:end,2:end)-A(2:end,1)*A(2:end,1)'./alpha);
            L = [sqrt(alpha), zeros(1,n-1); A(2:end,1)./sqrt(alpha), L_below ];
            D = [abs(alpha)/alpha, zeros(1,n-1) ; zeros(n-1,1), D_below];
             P = (P'*[1, zeros(1,n-1); zeros(n-1,1), P_below'])';
        else
            [L_below, D_below, P_below] =  recursive_cholesky(A(2:end,2:end));
            L = [zeros(1,n);zeros(n-1,1),L_below];
            D = [0,zeros(1,n-1); zeros(n-1,1), D_below];
            P = P*[1, zeros(1,n-1); zeros(n-1,1), P_below];
        end     
    end
else
    error('This is not an hermitian matrix')
end
end