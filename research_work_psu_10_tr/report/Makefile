.PHONY: all clean-tmp clean


all: report clean-tmp

report:
	pdflatex report
	biber report
	pdflatex report
	pdflatex report

clean-tmp:
	rm *.aux *.bbl *.blg *.log *.toc *.dvi *-blx.bib *.bcf *.run.xml chapters/*.aux -f

clean: clean-tmp
	rm report.pdf -f

