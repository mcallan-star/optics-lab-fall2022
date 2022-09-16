% knife-edge measurement of the beam radius.
% slide a razor across the beam, record transmitted power vs position.
% the power follows an error function and the width gives you w.
%   P(x) = P0/2 * (1 - erf( sqrt(2)*(x-x0)/w ))

clear; clc; close all;

d = dlmread('../data/knife_edge.csv', ',', 1, 0);   % position_mm, power_uW
x = d(:,1);
P = d(:,2);

% fit the erf with fminsearch (octave at home doesnt have lsqcurvefit)
model = @(b,x) b(1)/2 .* (1 - erf(sqrt(2)*(x-b(2))./b(3)));
b0 = [max(P), 0, 0.4];            % guess: P0, x0, w
b = fminsearch(@(b) sum((model(b,x) - P).^2), b0);

w = b(3);
fprintf('beam radius w = %.3f mm\n', w);

figure
plot(x, P, 'o'); hold on
xx = linspace(min(x), max(x), 200);
plot(xx, model(b,xx), 'r-', 'LineWidth', 1.5)
xlabel('knife position (mm)')
ylabel('power (\muW)')
title(sprintf('knife-edge fit, w = %.2f mm', w))
legend('data','erf fit')
grid on
% saveas(gcf,'../figures/knife_edge_fit.png')
