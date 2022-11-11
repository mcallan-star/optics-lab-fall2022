# week 11 - SLM / wavefront modulation

hardest lab. spatial light modulator = a grid of liquid-crystal pixels you program to add a phase pattern to the wavefront.

- amplitude vs phase modulation depends on the input polarization. took a while to get the input pol right (need it aligned to the LC axis for pure phase).
- made Laguerre-Gauss / vortex beams: load a "fork" hologram (helical phase exp(i*l*phi) plus a blazed grating) onto the SLM, the vortex shows up in the first diffraction order. donut intensity with a dark hole in the middle = the phase singularity.
- l=1 and l=2 both worked, the donut gets bigger with l.

lg_hologram.m builds the masks, lg_mode.png. honestly i only half get the OAM theory, need to reread the paper prof linked.
