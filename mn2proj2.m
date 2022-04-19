function S = mn2proj2(f)
% Autor: Jakub Rymuza
% Program liczy ca�k� podw�jn� z funkcji f(x,y) w granicach (0,inf)x(0,inf)
% z funkcj� wagow� exp(-x)*exp(-y) za pomoc� 10-punktowej kwadratury 
% Gaussa-Laguerre'a ze wzgl�du na ka�d� zmienn�.

n = 10;
[rt,A] = constants();
rtx = ones(n,1)*rt; % rtx = [rt; rt; rt;...]
S = sum(A*A.'.*f(rtx,rtx.'),'all');