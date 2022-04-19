function test (it)
% Autor: Jakub Rymuza
% funkcja testuj¹ca

d1 = 10;
d2 = 20;

% definicje wielomianow


w1 = @(x,y) 0.05*x.^(2*d1-1);
w2 = @(x,y) 0.05*x.^(2*d1);
w3 = @(x,y) 0.05*x.^((3/2)*d2);
w4 = @(x,y) 0.05*x.^(2*d2-1);
w5 = @(x,y) 0.05*x.^(2*d2);


w1e = @(x,y) exp(-x).*exp(-y).*w1(x,y);
w2e = @(x,y) exp(-x).*exp(-y).*w2(x,y);
w3e = @(x,y) exp(-x).*exp(-y).*w3(x,y);
w4e = @(x,y) exp(-x).*exp(-y).*w4(x,y);
w5e = @(x,y) exp(-x).*exp(-y).*w5(x,y);

r1 = 6082255020441600;
r2 = 121645100408832000;
r3 = 13262642990609552931815424000000;
r4 = 1019894104059872167932014086995144867840000000;
r5 = 40795764162394886717280563479805794713600000000;

% test precyzji

format compact;
temp = mn2proj2_test(w1,d1);
delta11 = err(temp,r1)
temp = mn2proj2_test(w1,d2);
delta12 = err(temp,r1)
temp = integral2(w1e,0,inf,0,inf);
deltaint1 = err(temp,r1)
% -------------------
temp = mn2proj2_test(w2,d1);
delta21 = err(temp,r2)
temp = mn2proj2_test(w2,d2);
delta22 = err(temp,r2)
temp = integral2(w2e,0,inf,0,inf);
deltaint2 = err(temp,r2)
% -------------------
temp = mn2proj2_test(w3,d1);
delta31 = err(temp,r3)
temp = mn2proj2_test(w3,d2);
delta32 = err(temp,r3)
temp = integral2(w3e,0,inf,0,inf);
deltaint3 = err(temp,r3)
% -------------------
temp = mn2proj2_test(w4,d1);
delta41 = err(temp,r4)
temp = mn2proj2_test(w4,d2);
delta42 = err(temp,r4)
temp = integral2(w4e,0,inf,0,inf);
deltaint4 = err(temp,r4)
% -------------------
temp = mn2proj2_test(w5,d1);
delta51 = err(temp,r5)
temp = mn2proj2_test(w5,d2);
delta52 = err(temp,r5)
temp = integral2(w5e,0,inf,0,inf);
deltaint5 = err(temp,r5)


% test szybkosci

sum1 = zeros(it,0);
sum2 = zeros(it,0);


for i = 1:it
    tic; mn2proj2(w1);
    sum1(i) = toc;
    tic; integral2(w1e,0,inf,0,inf);
    sum2(i) = toc;
end

sum1 = sum(sum1)
sum2 = sum(sum2)
end

function x = err(a,b)
x = abs(a-b)/b;
end