% beam waist + Rayleigh range after focusing with the f=150mm lens.
% measured the beam radius w at a bunch of z positions past the lens (knife edge
% each time, ugh, took forever) and fit the gaussian beam relation:
%   w(z) = w0 * sqrt( 1 + ((z-z0)/zR)^2 ),   zR = pi*w0^2/lambda

clear; clc; close all;

lambda = 633e-6;   % mm  (HeNe)
d = dlmread('../data/beam_waist.csv', ',', 1, 0);   % z_mm, w_mm
z = d(:,1);
w = d(:,2);

wz = @(b,z) b(1).*sqrt(1 + ((z-b(2))./(pi*b(1)^2/lambda)).^2);   % b = [w0, z0]
b = fminsearch(@(b) sum((wz(b,z) - w).^2), [0.03, 13]);   % fminsearch, no toolbox needed

w0 = b(1);
zR = pi*w0^2/lambda;
fprintf('waist w0 = %.1f um,  Rayleigh range zR = %.2f mm\n', w0*1000, zR);

figure
plot(z, w, 'o'); hold on
zc = linspace(min(z), max(z), 300);
plot(zc, wz(b,zc), 'r-')
xlabel('z from lens (mm)'); ylabel('beam radius w (mm)')
title(sprintf('focused waist w0 = %.0f um, zR = %.1f mm', w0*1000, zR))
legend('data','fit'); grid on
% saveas(gcf,'../figures/beam_waist.png')
