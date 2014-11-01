.PHONY: report
report: out/report.pdf


.PHONY: presentation
presentation: out/presentation.pdf

all_deps := tex/presentation.tex tex/mystyle.sty tex/maturastyle.bst tex/mybib.bib
pres_deps := $(shell find tex/presentation | grep ".tex")
rep_deps := $(shell find tex/report/ | grep ".tex")
sage_deps := $(shell find tex/ | grep ".sage")


out/presentation.pdf : tex/presentation.tex $(all_deps) $(pres_deps) $(sage_deps)
	-mkdir out
	-cd tex && latexmk -pdf -shell-escape presentation.tex
	-find . -type f -name '*.sage' -execdir sage {} +
	-latexmk -pdf -shell-escape report.tex
	mv tex/presentation.pdf out/presentation.pdf

out/report.pdf : tex/report.tex $(all_deps) $(rep_deps) $(sage_deps)
	-mkdir out
	-cd tex && latexmk -pdf -shell-escape report.tex
	-find . -type f -name '*.sage' -execdir sage {} +
	-latexmk -pdf -shell-escape report.tex
	mv tex/report.pdf out/report.pdf

.PHONY: clean
clean:
	rm -rf tex/gnuplottex
	-find tex -type f -name 'report.*' -not -name '*.tex' | xargs rm
	-find tex -type f -name 'presentation.*' -not -name '*.tex' | xargs rm
	cd tex && latexmk -c
