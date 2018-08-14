set title 'Write Amplification'
set xlabel 'Fsync'
set ylabel 'Amplification %'

set grid
set tics out nomirror
set border 3 front linetype black linewidth 1.0 dashtype solid

set mxtics 1
#set xtics 1
#set yrange[-50:5000]
set xrange[-5:256]

set style line 1 linecolor rgb 'red' linetype 1 linewidth 2
set style line 2 linecolor rgb 'blue' linetype 1 linewidth 2

set terminal png enhanced
set output 'cow.png'
plot 'cow.dat' using 1:2 with lines linestyle 1 title 'LOG COW', \
            '' using 1:3 with lines linestyle 2 title 'LOG NO-COW'
