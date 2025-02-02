#!/bin/bash
for i in {1..10}; do
    ~/Downloads/ngspice-42/release/src/ngspice full_spice_sim.cir
    TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")
    FILE="plot.svg"
    mv "$FILE" "${TIMESTAMP}.svg"
    echo "$i File renamed to: ${TIMESTAMP}.svg"
done
