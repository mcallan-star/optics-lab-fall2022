% HeNe output power as it warms up. logged the power meter every minute after
% turning it on. wanted to know how long to wait before taking real data.
% answer: like 20 min to be safe.

clear; clc; close all;

d = dlmread('../data/hene_warmup.csv', ',', 1, 0);   % col1 time(min), col2 power(mW)
t = d(:,1);
P = d(:,2);

plot(t, P, 'o-')
xlabel('time after power on (min)')
ylabel('output power (mW)')
title('HeNe warmup')
grid on

fprintf('final power ~ %.2f mW\n', mean(P(end-3:end)))
% saveas(gcf,'../figures/hene_warmup.png')
