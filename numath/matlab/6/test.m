a_1 = 10;
a_2 = 13;
a_3 = 8;
a_4 = 10;
beta_k = @(k) k * pi / 100;
f = @(x, beta) a_1 / a_2 * cos(beta) - a_1 / a_4 * cos(x) - cos(beta - x) + (a_1^2+a_2^2-a_3^2+a_4^2)/(2*a_2*a_4);
% Derivation
df = @(x, beta) a_1 / a_4 * sin(x) + sin(x - beta);

% From k directly
f_50 = @(x) f(x, beta_k(50));
df_50 = @(x) df(x, beta_k(50));

tol = 1E-8;
x = -10:0.1:10;
y = f_50(x);
plot(x,y);

% TEST 1 - "Bisektion"
a = -6;
b = -4;
[alpha_50_1, ~, iter_1] = bisektion(f_50, a, b, tol)

a = -2;
b = 2;
[alpha_50_2, ~, iter2] = bisektion(f_50, a, b, tol)