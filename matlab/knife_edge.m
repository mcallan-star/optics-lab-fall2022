% knife-edge measurement of the beam radius.
% slide a razor across the beam, record transmitted power vs position, fit an erf.

clear; clc; close all;

d = dlmread('../data/knife_edge.csv', ',', 1, 0);   % position_mm, power_uW
x = d(:,1);
P = d(:,2);

% P(x) = P0/2 * (1 + erf(...))  ??  my fit comes out upside down, something is off
model = @(b,x) b(1)/2 .* (1 + erf(sqrt(2)*(x-b(2))./b(3)));
b0 = [max(P), 0, 0.4];
b = fminsearch(@(b) sum((model(b,x) - P).^2), b0);

w = b(3);
fprintf('beam radius w = %.3f mm\n', w);   % w comes out negative, ???

figure
plot(x, P, 'o'); hold on
xx = linspace(min(x), max(x), 200);
plot(xx, model(b,xx), 'r-')
xlabel('knife position (mm)'); ylabel('power (\muW)')
title('knife edge (fit looks wrong, fix later)')
% TODO the erf is flipped, the beam is being BLOCKED as x increases so power goes DOWN
