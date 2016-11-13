A = randn(10,10) + i*randn(10,10)
[U,~ ] = eig((A+ctranspose(A)))
