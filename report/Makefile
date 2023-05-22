.PHONY: all clean-tmp clean


report-signed: title-signed report-pdf clean-tmp count
	mv report.pdf 'Лукьянов А. ПМИ-2 ВКР.pdf'

report: title report-pdf clean-tmp count

report-with-fonts: report-with-fonts-pdf clean-tmp count

insert-fonts:
	pdf2ps report.pdf
	ps2pdf14 -dPDFSETTINGS=/prepress report.ps report.pdf
	rm report.ps

report-pdf:
	pdflatex --shell-escape report.tex
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

title:
	soffice --headless --convert-to pdf title.docx

title-signed:
	soffice --headless --convert-to pdf title.signed.docx 
	mv title.signed.pdf title.pdf


clean-tmp:
	rm *.aux *.bbl *.blg *.log *.toc *.dvi *-blx.bib *.bcf *.run.xml chapters/*.aux *.out *.ps -f
	rm svg-inkscape -rf

clean: clean-tmp
	rm report.pdf -f


count:
	ps2ascii report.pdf | wc -w
	pdfinfo report.pdf | awk '/^Pages:/ {print $2}'
