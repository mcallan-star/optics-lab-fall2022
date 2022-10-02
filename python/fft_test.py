# playing with FFTs in python before i trust the michelson analysis. make a fake fringe
# signal at a known frequency, FFT it, check the peak lands where it should. it does.
# (also i just like numpy's fft better than matlab's, dont tell anyone)
import numpy as np
import matplotlib.pyplot as plt

fs = 2000.0          # samples per mm, pretend
x = np.arange(0, 2, 1/fs)
true_freq = 316.0    # fringes per mm (lambda/2 ~ 0.316 um -> ~3160/mm... toy numbers)
signal = np.cos(2*np.pi*true_freq*x) + 0.3*np.random.randn(len(x))

spec = np.abs(np.fft.rfft(signal))
freq = np.fft.rfftfreq(len(x), 1/fs)
peak = freq[np.argmax(spec)]
print("peak freq:", round(peak, 1), " (put in", true_freq, ")")

fig, ax = plt.subplots(2, 1)
ax[0].plot(x[:100], signal[:100]); ax[0].set_title("fringe-ish signal")
ax[1].plot(freq, spec); ax[1].set_xlim(0, 800); ax[1].set_title("fft")
plt.tight_layout(); plt.show()
