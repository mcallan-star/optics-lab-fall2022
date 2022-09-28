# week 4-5 - michelson interferometer

## week 4: build + wavelength
beam splitter + two mirrors, recombine on the detector.
- alignment is SO fiddly. you have to overlap the two return beams almost perfectly to see fringes, then tweak mirror tilt until they spread out into nice rings.
- counted fringes vs a known mirror displacement -> lambda ~ 640 nm (close to 633). one fringe = lambda/2 of mirror travel.
- also FFT'd the intensity trace instead of counting by eye (michelson_fft.m), peak spatial freq gives the fringe spacing. cleaner.

## week 5: piezo calibration
- stuck a piezo on the back mirror, ramped the voltage, counted fringes per volt
- displacement vs voltage is linear, ~18.5 nm/V (piezo_cal.png)
- this is what let's us do sub-wavelength scans later

visibility was less than 1 (fringes not fully dark). coherence length? ask prof.
