% learning matlab. prof said we use this all semester so might as well get going.
% just messing with plots + fitting, nothing real here yet

clear all   % i know clear all is bad form, deal with it
clc
close all

% sine wave just to see plotting work
x = linspace(0, 2*pi, 200);
y = sin(x);
subplot(2,1,1)
plot(x, y)
title('matlab practice')
grid on

% fitting a line with polyfit (this is the useful bit)
xx = 0:10;
yy = 2.3*xx + 1 + 2*randn(1,11);   % made up noisy data
p = polyfit(xx, yy, 1);
fprintf('slope = %.2f, intercept = %.2f\n', p(1), p(2))

subplot(2,1,2)
plot(xx, yy, 'o')
hold on
plot(xx, polyval(p,xx), 'r-')
legend('data','fit')
grid on
% saveas(gcf,'../figures/matlab_practice.png')
