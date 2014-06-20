.PHONY: report
report: out/report.pdf


.PHONY: presentation
presentation: out/presentation.pdf

all_deps := tex/presentation.tex tex/mystyle.sty tex/maturastyle.bst tex/mybib.bib
pres_deps := $(shell find tex/presentation | grep ".tex")
rep_deps := $(shell find tex/report/ | grep ".tex")


out/presentation.pdf : tex/presentation.tex $(all_deps) $(pres_deps)
	-cd tex && latexmk -pdf -shell-escape presentation.tex
	mv tex/presentation.pdf out/presentation.pdf

out/report.pdf : tex/report.tex $(all_deps) $(rep_deps)
	-cd tex && latexmk -pdf -shell-escape report.tex
	mv tex/report.pdf out/report.pdf

.PHONY: clean
clean:
	rm -rf tex/gnuplottex
	-find tex -type f -name 'report.*' -not -name '*.tex' | xargs rm
	-find tex -type f -name 'presentation.*' -not -name '*.tex' | xargs rm
	cd tex && latexmk -c
