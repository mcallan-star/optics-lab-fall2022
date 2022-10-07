# redoing the fresnel reflectance in python to double check the brewster angle (octave
# does the real .m version). just wanted to see it in numpy too, python is nice for this.
import numpy as np
import matplotlib.pyplot as plt

n1, n2 = 1.0, 1.515
theta = np.linspace(0, np.pi/2, 500)
st = n1/n2*np.sin(theta)
ct = np.sqrt(1 - st**2)
ci = np.cos(theta)

Rs = ((n1*ci - n2*ct)/(n1*ci + n2*ct))**2
Rp = ((n2*ci - n1*ct)/(n2*ci + n1*ct))**2
brewster = np.degrees(np.arctan(n2/n1))
print("brewster angle =", round(brewster, 1), "deg")   # ~56.6, matches matlab

plt.plot(np.degrees(theta), Rs, label="s-pol")
plt.plot(np.degrees(theta), Rp, label="p-pol")
plt.axvline(brewster, color="k", ls="--", lw=0.8)
plt.xlabel("angle (deg)"); plt.ylabel("R"); plt.legend()
plt.title("fresnel, same as the matlab one")
plt.show()
