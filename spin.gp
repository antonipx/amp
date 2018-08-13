set title 'Write Amplification'
set xlabel 'Fsync'
set ylabel 'Amplification %'

set grid
set tics out nomirror
set border 3 front linetype black linewidth 1.0 dashtype solid

set mxtics 1
#set xtics 1
set yrange[-1:9000]
set xrange[-5:256]

set style line 1 linecolor rgb '#FF0000' linetype 1 linewidth 2
set style line 2 linecolor rgb '#0000FF' linetype 1 linewidth 2
set style line 3 linecolor rgb '#00A000' linetype 1 linewidth 2
#set style line 4 linecolor rgb '#FFA000' linetype 1 linewidth 2

set terminal png enhanced
set output 'spin.png'
plot 'spin.dat' using 1:2 with lines linestyle 1 title '1 Disk', \
            '' using 1:3 with lines linestyle 2 title '2 Disks', \
            '' using 1:4 with lines linestyle 3 title '3 Disks'
