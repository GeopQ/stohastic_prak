%Task6
%% Monte-Carlo method
clear;
clc;
n = 1e2;
S_n = 0;
sigma = 0;
alpha = 0.99;
tic;
for i = 1:n
    x = normrnd(0, sqrt(0.5), 1, 10);
    F = pi^5 * exp(-1/(2^7*prod(x).^2))/prod(x).^2;
    S_n = S_n + F;
    sigma = sigma + F^2;
end
integral = S_n/n;
toc;
disp(['integral = ', num2str(integral)]);
x_p = norminv((1 + alpha)/2, 0, 1);
eps = x_p * sqrt(sigma/n - integral^2) / sqrt(n);
disp(['error = ', num2str(eps)]);