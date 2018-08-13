set title 'Write Amplification'
set xlabel 'Fsync'
set ylabel 'Amplification %'

set grid
set tics out nomirror
set border 3 front linetype black linewidth 1.0 dashtype solid

set mxtics 1
#set xtics 1
set yrange[0:100]
set xrange[0:16]

set style line 1 linecolor rgb '#FF0000' linetype 1 linewidth 2
set style line 2 linecolor rgb '#0000FF' linetype 1 linewidth 2
set style line 3 linecolor rgb '#00A000' linetype 1 linewidth 2
#set style line 4 linecolor rgb '#FFA000' linetype 1 linewidth 2

set terminal png enhanced
set output 'iojd.png'
plot 'iojd.dat' using 1:2 with lines linestyle 1 title 'BTRFS ONLY', \
            '' using 1:3 with lines linestyle 2 title 'IOPROFILE=DB', \
            '' using 1:4 with lines linestyle 3 title 'IOPROFILE=DB + Journal Dev', \
