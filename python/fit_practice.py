# curve_fit practice. matlab has lsqcurvefit, python has scipy curve_fit. same idea.
# fitting a cos^2 (for malus) and a gaussian, just to be comfortable with both before
# the real polarization data comes in.
import numpy as np
from scipy.optimize import curve_fit
import matplotlib.pyplot as plt

# cos^2 (malus)
ang = np.arange(0, 181, 10.0)
truth = 5*np.cos(np.radians(ang-15))**2 + 0.1
data = truth + 0.1*np.random.randn(len(ang))
cos2 = lambda a, A, a0, o: A*np.cos(np.radians(a-a0))**2 + o
popt, _ = curve_fit(cos2, ang, data, p0=[4, 0, 0])
print("malus fit: Pmax=%.2f, angle0=%.1f" % (popt[0], popt[1]))

plt.plot(ang, data, "o", label="data")
aa = np.linspace(0, 180, 300)
plt.plot(aa, cos2(aa, *popt), "r-", label="cos^2 fit")
plt.legend(); plt.title("cos^2 fit practice"); plt.show()
