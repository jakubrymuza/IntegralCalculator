function S = mn2proj2_test(f,n)
% Autor: Jakub Rymuza
% zmodyfikowana funkcja mn2proj2 u¿ywana do testowania

[rt,A] = constants_test(n);
rtx = ones(n,1)*rt; % rtx = [rt; rt; rt;...]
S = sum(A*A.'.*f(rtx,rtx.'),'all');