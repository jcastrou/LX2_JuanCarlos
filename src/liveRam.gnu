set xrange [-1:1]
set yrange [0:200]
plot "ram.dat" using 1 with lines title "RAM"
pause 1
reread
