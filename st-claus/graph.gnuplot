#!/opt/local/bin/gnuplot -persist
set datafile separator ","
#set title "Simulation Result"
set xlabel "number of syncs/works"
set ylabel "response time (ms)"
set key top left
set term pdfcairo
set output "jason-time.pdf"
#set terminal postscript eps color enhanced
#set output "jason-time.eps"
plot "data.csv" title "Jason Time" smooth csplines
