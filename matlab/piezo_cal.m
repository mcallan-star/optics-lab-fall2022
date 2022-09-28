% calibrating the piezo on the michelson mirror.
% for each voltage i counted fringes shifting -> displacement = (fringes)*lambda/2.
% plot displacement vs voltage, slope is the calibration in nm/V. nice and linear.

clear; clc; close all;

d = dlmread('../data/piezo.csv', ',', 1, 0);   % voltage_V, displacement_nm
V = d(:,1);
y = d(:,2);

p = polyfit(V, y, 1);
fprintf('piezo calibration = %.2f nm/V\n', p(1));

plot(V, y, 'o'); hold on
plot(V, polyval(p,V), 'r-')
xlabel('piezo voltage (V)'); ylabel('mirror displacement (nm)')
title(sprintf('piezo cal = %.1f nm/V', p(1)))
legend('data', sprintf('%.1f nm/V', p(1)), 'Location','northwest')
grid on
% saveas(gcf,'../figures/piezo_cal.png')
