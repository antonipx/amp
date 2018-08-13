set title 'Write Amplification'
set xlabel 'Fsync'
set ylabel 'Amplification %'

set grid
set tics out nomirror
set border 3 front linetype black linewidth 1.0 dashtype solid

set mxtics 1
#set xtics 1
set yrange[-50:350]
set xrange[-1:33]

set style line 1 linecolor rgb 'red' linetype 1 linewidth 2
set style line 2 linecolor rgb 'blue' linetype 1 linewidth 2
set style line 3 linecolor rgb '#00A000' linetype 1 linewidth 2
#set style line 4 linecolor rgb '#FFA000' linetype 1 linewidth 2

set terminal png enhanced
set output 'iopdb.png'
plot 'iopdb.dat' using 1:2 with lines linestyle 3 title 'BTRFS ONLY', \
            '' using 1:3 with lines linestyle 2 title 'IOPDB 1.2', \
            '' using 1:4 with lines linestyle 1 title 'IOPDB 1.3', \
