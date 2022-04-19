function S = mn2proj2(f)
% Autor: Jakub Rymuza
% Program liczy ca³kê podwójn¹ z funkcji f(x,y) w granicach (0,inf)x(0,inf)
% z funkcj¹ wagow¹ exp(-x)*exp(-y) za pomoc¹ 10-punktowej kwadratury 
% Gaussa-Laguerre'a ze wzglêdu na ka¿d¹ zmienn¹.

n = 10;
[rt,A] = constants();
rtx = ones(n,1)*rt; % rtx = [rt; rt; rt;...]
S = sum(A*A.'.*f(rtx,rtx.'),'all');