.PHONY: report
report: out/report.pdf


.PHONY: presentation
presentation: out/presentation.pdf


out/presentation.pdf : tex/presentation.tex tex/presentation/*.tex
	-cd tex && latexmk -pdf -shell-escape presentation.tex
	-mkdir out
	mv tex/presentation.pdf out/presentation.pdf
	-cd tex && rm presentation.^tex

out/report.pdf : tex/*.tex
	-cd tex && latexmk -pdf -shell-escape report.tex
	-mkdir out
	mv tex/report.pdf out/report.pdf
	-cd tex && rm report.^tex
