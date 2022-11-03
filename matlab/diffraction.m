% single slit diffraction. scanned the detector across the screen and recorded
% intensity. fit to sinc^2 to pull out the slit width a.
%   I(x) = I0 * sinc^2( pi*a*x / (lambda*L) )
% note: matlab's sinc is sin(pi x)/(pi x) so i divide the argument by pi.

clear; clc; close all;

lambda = 633e-6;   % mm
L = 1000;          % mm, slit to screen

d = dlmread('../data/diffraction.csv', ',', 1, 0);   % x_mm, intensity
x = d(:,1);
I = d(:,2);

% matlab's sinc lives in the signal toolbox, define it inline (sin(pi t)/(pi t), =1 at 0)
nsinc = @(t) sin(pi*t)./(pi*t + (t==0)) + (t==0);
model = @(b,x) b(1) .* nsinc( b(2).*x ./ (lambda*L) ).^2;   % b = [I0, a]
b = fminsearch(@(b) sum((model(b,x) - I).^2), [1, 0.1]);   % fminsearch, runs in octave
a = b(2);
fprintf('slit width a = %.1f um\n', a*1000);

plot(x, I, 'o', 'MarkerSize', 3); hold on
xc = linspace(min(x), max(x), 600);
plot(xc, model(b,xc), 'r-')
xlabel('screen position (mm)'); ylabel('intensity (norm)')
title(sprintf('single slit, a = %.0f um', a*1000))
legend('data','sinc^2'); grid on
% saveas(gcf,'../figures/diffraction.png')
