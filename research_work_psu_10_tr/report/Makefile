.PHONY: all clean-tmp clean


report: report-pdf clean-tmp count

report-with-fonts: report-with-fonts-pdf clean-tmp count

insert-fonts:
	pdf2ps report.pdf
	ps2pdf14 -dPDFSETTINGS=/prepress report.ps report.pdf
	rm report.ps

report-pdf:
	pdflatex report
	biber report
	pdflatex report
	pdflatex report

report-with-fonts-pdf:
	latex report
	biber report
	latex report
	latex report

	# dvips -Ppdf -G0 report
	dvips report
	# ps2pdf -dPDFSETTINGS=/prepress report.ps
	ps2pdf report.ps


clean-tmp:
	rm *.aux *.bbl *.blg *.log *.toc *.dvi *-blx.bib *.bcf *.run.xml chapters/*.aux *.out *.ps -f

clean: clean-tmp
	rm report.pdf -f


count:
	ps2ascii report.pdf | wc -w
	pdfinfo report.pdf | awk '/^Pages:/ {print $2}'
