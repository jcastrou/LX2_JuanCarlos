set xrange [0:1]
set yrange [0:200]
plot "cpu.dat" using 1 with lines title "CPU"
pause 1
reread
