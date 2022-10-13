% thin lens focal length. moved the object, found the image, recorded so and si.
% thin lens eqn: 1/so + 1/si = 1/f. if you plot 1/si vs 1/so its a line with slope -1
% and the y-intercept is 1/f. linearizing instead of just averaging f each time.

clear; clc; close all;

d = dlmread('../data/lens.csv', ',', 1, 0);   % so_cm, si_cm
so = d(:,1);
si = d(:,2);

x = 1./so;
y = 1./si;
p = polyfit(x, y, 1);     % y = p1*x + p2, intercept p2 = 1/f
f = 1/p(2);
fprintf('focal length f = %.2f cm   (slope = %.2f, should be ~ -1)\n', f, p(1));

plot(x, y, 'o'); hold on
plot(x, polyval(p,x), 'r-')
xlabel('1/so (1/cm)'); ylabel('1/si (1/cm)')
title(sprintf('thin lens, f = %.1f cm', f))
legend('data','fit'); grid on
% saveas(gcf,'../figures/lens_focal.png')
