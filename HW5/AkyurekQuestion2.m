%AkyurekQuestion2 Test
A = [2 -1 0;
       -1 2 -1;
       0  -1 2];
L = cholesky_factorization( A )

A2 = L*L'L