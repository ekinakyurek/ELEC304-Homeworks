  function out=generaterandvec(N,R)
  % Generates zero-mean complex Gaussian random vector sequence with the specified
  % covariance matrix
  % Usage
  %  out=generaterandvec(N,R)
  % Here
  % N: Number of vectors to be generated
  % R: The specified covariance matrix.
  % out: Output matrix containing vector sequence. Assuming R is a pxp postive matrix
  % out would be a pxN matrix
   [L,D] = ldlt_factorization(R);
   if D >= 0
       out = L*randn(size(R,1),N);
   else
       error('It is inappropriate coveriance matrix ')
   end
  end
  
  
function [L, D] =ldlt_factorization(A)
threshold =10e-12;
n = size(A,1);
m = size(A,2);
if n==m & A == A'
    if size(A,1) == 1
            L = [sqrt(A)];
        if abs(A(1,1)) < threshold
            D = [0];
        else 
            D = [A/abs(A)];
        end
    else 
            alpha = A(1,1);
            if abs(alpha) >  threshold 
                [L_below, D_below] = ldlt_factorization( A(2:end,2:end)-A(2:end,1)*A(2:end,1)'./alpha  );
                L = [sqrt(alpha), zeros(1,n-1); A(2:end,1)./sqrt(alpha), L_below ];
                D = [abs(alpha)/alpha, zeros(1,n-1) ; zeros(n-1,1), D_below];
            else
                error('Defactorization error')
            end

    end  
else
    error('This is not an hermitian matrix')
end
end