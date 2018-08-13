set title 'Write Amplification'
set xlabel 'Fsync = 8'
set ylabel 'Amplification %'

set boxwidth 0.5
set style fill solid 

unset key

#set yrange[0:1000]

set linetype 1 lc rgb '#00A000'
set linetype 2 lc rgb '#0000FF'
set linetype 3 lc rgb '#FF0000'



set terminal png enhanced
set output 'amp8.png'
plot 'amp8.dat' using 0:3:($0+1):xtic(2)  with boxes linecolor variable
