# week 3 - gaussian beams

knife edge day. took forever.

- measured w at the laser output, then focused with the f=150mm lens and measured w(z) at a bunch of z to find the new waist + Rayleigh range
- knife edge = slide a razor across the beam on a micrometer stage, record transmitted power. its an erf, the width gives you w. (knife_edge.m, beam_waist.m)
- the micrometer stage has BACKLASH. had to always approach from the same direction or the positions were garbage. lost an hour before i caught it.

results:
- output waist ~ 0.42 mm
- focused waist w0 ~ 30 um, zR ~ 4.5 mm (beam_waist.png)
- vs the calculated waist from spot-size-on-lens + f: close, off by ~15%, probably my z=0 reference was sloppy. ask prof if that's expected.
