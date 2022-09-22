% michelson interferometer. scanned one mirror and recorded the detector intensity.
% instead of counting fringes by eye (did that too, my eyes hurt) i FFT the trace and
% the peak spatial frequency gives the fringe spacing -> lambda/2 per fringe.

clear; clc; close all;

d = dlmread('../data/michelson_trace.csv', ',', 1, 0);   % pos_um, intensity
x = d(:,1);
I = d(:,2);
dx = x(2)-x(1);

I = I - mean(I);
N = length(I);
F = abs(fft(I));
F = F(1:floor(N/2));
f = (0:floor(N/2)-1)/(N*dx);   % 1/um

[~,k] = max(F);
fpeak = f(k);
fprintf('fringe spacing = %.4f um  (expect lambda/2 ~ %.4f um)\n', 1/fpeak, 0.633/2);

subplot(2,1,1)
plot(x(1:200), I(1:200))
title('fringe intensity (zoom)'); grid on
subplot(2,1,2)
plot(f, F); xlim([0 5000])
xlabel('spatial freq (1/um)'); title('FFT'); grid on
% saveas(gcf,'../figures/michelson_fft.png')
