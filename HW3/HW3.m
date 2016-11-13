A = exp(i*2*pi*rand(10,10));
U = expm(i*(A+ctranspose(A))/2);

h = randn(10)
eigh[h]