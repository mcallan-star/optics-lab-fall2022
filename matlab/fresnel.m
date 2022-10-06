% reflectance off a glass slide vs angle, for s and p polarization.
% compare measured points to the Fresnel equations. the p-pol should hit ZERO at
% Brewster's angle = atan(n2/n1). that's the cool part.

clear; clc; close all;

n1 = 1.0;       % air
n2 = 1.515;     % glass (BK7 ish)

% theory curves
th = linspace(0, 89, 400)*pi/180;
st = n1/n2*sin(th);
ct = sqrt(1 - st.^2);
ci = cos(th);
Rs = ((n1*ci - n2*ct)./(n1*ci + n2*ct)).^2;
Rp = ((n2*ci - n1*ct)./(n2*ci + n1*ct)).^2;
brewster = atand(n2/n1);
fprintf('predicted Brewster angle = %.1f deg\n', brewster);

% our measured points
d = dlmread('../data/reflectance.csv', ',', 1, 0);   % angle_deg, Rs, Rp
ang = d(:,1); Rsm = d(:,2); Rpm = d(:,3);

figure
plot(th*180/pi, Rs, 'b-'); hold on
plot(th*180/pi, Rp, 'g-')
plot(ang, Rsm, 'bo')
plot(ang, Rpm, 'gs')
plot([brewster brewster], [0 1], 'k--')   % brewster marker (xline isnt in old octave)
xlabel('angle of incidence (deg)'); ylabel('reflectance R')
title('Fresnel reflectance, glass n = 1.515')
legend('Rs theory','Rp theory','Rs meas','Rp meas','Brewster')
grid on
% saveas(gcf,'../figures/fresnel_brewster.png')
