# quick single-slit diffraction sim to compare with what we measured in lab.
# I(theta) = I0 * sinc^2(pi a sin(theta) / lambda). numpy's sinc already has the pi in it.
import numpy as np
import matplotlib.pyplot as plt

lam = 633e-9      # m
a = 90e-6         # slit width, m
theta = np.linspace(-0.03, 0.03, 1000)   # rad
beta = a*np.sin(theta)/lam
I = np.sinc(beta)**2     # np.sinc(x) = sin(pi x)/(pi x), exactly what we want here

plt.plot(np.degrees(theta), I)
plt.xlabel("angle (deg)"); plt.ylabel("I/I0")
plt.title("single slit, a = 90 um")
plt.grid(True, alpha=0.4)
plt.show()
# matches the lab pattern pretty well, central max + the little side lobes
