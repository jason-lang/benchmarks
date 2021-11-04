#!/opt/local/bin/gnuplot -persist
set datafile separator ","
#set title "Simulation Result"
set xlabel "number of concurrent CNP"
set ylabel "CPU time (ms)"
set key top left

#set term pdfcairo
#set output "jason3-time.pdf"
#plot "data-er.csv" title "Jason3(ER)"  smooth sbezier,\
#     "data-j1.csv" title "Jason1"   smooth sbezier,\
#     "data-j2.csv" title "Jason2"   smooth sbezier

# smooth sbezier
# smooth option sbezier csplines

#set term pngcairo
#set output "jason3-time.png"
#plot "data-er.csv" title "Jason3(ER)"  smooth sbezier,\
#     "data-j1.csv" title "Jason1"   smooth sbezier,\
#     "data-j2.csv" title "Jason2"   smooth sbezier

set term pdfcairo font "Helvetica"
set output "jason3-time.pdf"
plot "data-er.csv" title "Jason3(ER)"  smooth sbezier,\
    "data-j2.csv" title "Jason 2"   smooth sbezier
