% final project: making Laguerre-Gauss (vortex) beams with the SLM.
% an LG mode has a helical phase exp(i*l*phi) and a donut intensity (zero on axis).
% to make one you load a "fork" hologram onto the SLM: the helical phase plus a blazed
% grating so the vortex shows up in the first diffraction order.
% this script just builds + previews the masks, the actual SLM upload is separate.

clear; clc; close all;

N = 400;
g = linspace(-3, 3, N);
[X, Y] = meshgrid(g, g);
R = sqrt(X.^2 + Y.^2);
PHI = atan2(Y, X);
l = 1;                 % topological charge

LG = (R.^abs(l)) .* exp(-R.^2);
I = LG.^2 / max(LG(:)).^2;

phase = angle(exp(1i*l*PHI));
fork  = angle(exp(1i*(l*PHI + 2*pi*2*X)));   % helical phase + blazed grating

subplot(1,3,1); imagesc(I);     axis image off; title('LG l=1 intensity'); colormap(gca, hot)
subplot(1,3,2); imagesc(phase); axis image off; title('helical phase')
subplot(1,3,3); imagesc(fork);  axis image off; title('fork hologram'); colormap(gca, gray)
% saveas(gcf,'../figures/lg_mode.png')
