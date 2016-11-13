%Recursive LDL' decomposition
%It returns L, D such that:
%A = L*D*L'
%D is the diagonal matrix with signs of the eigen values
%L is the lower triangular matrix.
function [L, D] =ldlt_factorization(A)
%Matlab use floating point arithmetic therefore, I define zero threshold
threshold =10e-12;
%row size of A
n = size(A,1);
%columns size of A
m = size(A,2);
%check if A is hermitian
if n==m & A == A'
    %If A is not martix then evalutaion we can partition any more 
    if size(A,1) == 1
            %LL' = A therefore L is sqrt of A when A is scalar
            L = [sqrt(A)];
        if abs(A(1,1)) < threshold
            %If A is zero then we put D a zero
            D = [0];
        else 
            %If A is positive or negative we put D sign of A
            D = [A/abs(A)];
        end
    else 
            %first diagonal element of A,
            alpha = A(1,1);
            %I explained logic of LDL' decompositon in Question1, these
            %part is just the matlab code of that logic.
            if abs(alpha) >  threshold 
                [L_below, D_below] = ldlt_factorization( A(2:end,2:end)-A(2:end,1)*A(2:end,1)'./alpha  );
                L = [sqrt(alpha), zeros(1,n-1); A(2:end,1)./sqrt(alpha), L_below ];
                D = [abs(alpha)/alpha, zeros(1,n-1) ; zeros(n-1,1), D_below];
            else
                %If alpha is zero we cant continue to decomposition any more
                error('Defactorization error')
            end

    end  
else
    error('This is not an hermitian matrix')
end
end
