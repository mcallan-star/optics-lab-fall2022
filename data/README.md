# data

reduced measurements, one csv per experiment. the column names are in the header line of each file. load with `dlmread('file.csv', ',', 1, 0)` (skips the header row, works in both matlab and octave) or `np.genfromtxt(..., delimiter=',', names=True)` in python.

the raw camera frames and spectrometer exports live in `data/raw/` which is gitignored, they were way too big to commit.
