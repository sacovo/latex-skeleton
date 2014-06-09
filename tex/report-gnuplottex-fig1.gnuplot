set terminal cairolatex color dashed
set output 'report-gnuplottex-fig1.tex'
set format '\num{%g}'
set key box top left
set key width 4
set key height 0.25
set key spacing 1.2
set key opaque
set sample 1000
set xlabel 'Zeit in \SI{}{\s}'
set ylabel 'GC-Signal, ADC, willk. Einheit'
plot sin(x)
