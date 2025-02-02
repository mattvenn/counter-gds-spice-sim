# Simulating a digital GDS with ngspice

I ran into an odd simulation issue when trying to simulate the spice extracted from an OpenLane generated
GDS.

The design is a 4 bit counter, and so on every other clock there should be a pulse on bit0 of the count. But occasionaly bit0 would toggle on the negative edge.

Neg edge toggle at 14us:

![](plots/mc/10ns/2025-02-02-14-48-05.svg)

# tt_mm corner

fails with 10n timestep

works with 5n

    tran 5n 40u 

fails with 10

trying longer clock period

    Vclk clk 0 PULSE {vcc} 0 0.5u 1n 1n 2u 4u

## tt corner

works with 5n timestep
works with 10n timestep
fails with 20n timestep

## building the spice from the verilog

* use openlane with the config in ./openlane to create the gds
* open the resulting gds file in magic, and then run the following commands:

    extract all
    ext2sim labels on
    ext2sim
    extresist tolerance 10
    extresist
    ext2spice lvs
    ext2spice cthresh 0
    ext2spice extresist on
    ext2spice -o count.sim.spice
