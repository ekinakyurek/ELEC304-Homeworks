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
   L = cholesky_factorization(R);
   out = L*randn(size(R,1),N);
  end