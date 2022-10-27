% Malus's law. rotate a polarizer in front of a polarized beam, record transmitted
% power vs angle. should be cos^2. this is also the warmup for the final project
% (polarization / wave plates).
%   P(theta) = Pmax * cos^2(theta - theta0) + offset

clear; clc; close all;

d = dlmread('../data/malus.csv', ',', 1, 0);   % angle_deg, power_mW
ang = d(:,1);
P = d(:,2);

model = @(b,a) b(1).*cosd(a - b(2)).^2 + b(3);   % b = [Pmax, theta0, offset]
b = fminsearch(@(b) sum((model(b,ang) - P).^2), [4.5, 0, 0]);
fprintf('Pmax = %.2f mW, offset angle = %.1f deg, bg = %.2f mW\n', b(1), b(2), b(3));

plot(ang, P, 'o'); hold on
ac = linspace(0,180,300);
plot(ac, model(b,ac), 'r-')
xlabel('polarizer angle (deg)'); ylabel('transmitted power (mW)')
title('Malus law, cos^2 fit')
legend('data','cos^2 fit'); grid on
% saveas(gcf,'../figures/malus.png')
