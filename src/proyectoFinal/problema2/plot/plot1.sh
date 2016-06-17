#!/bin/bash

graficar(){

gnuplot <<EOF 2> error.log
plot "grafico-0.dat" using 1:1 with lines title "Monto totales"
set term png
set output 'funcion1.png'
replot
EOF
}
graficar
