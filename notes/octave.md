# octave (matlab at home)

the matlab license on my laptop kept expiring so i installed octave (a free matlab clone) and ran my analysis in it at home. mostly just works, same `.m` files.

two things i had to change:
- no `lsqcurvefit` in core octave, so i fit with `fminsearch` (minimize the sum of squares). works in matlab too.
- no `readmatrix` either, used `dlmread('file.csv', ',', 1, 0)` instead.

plots come out looking like matlab. render headless with `figure('visible','off')` then `print('out.png','-dpng')`. the figures in `figures/` are from octave.
