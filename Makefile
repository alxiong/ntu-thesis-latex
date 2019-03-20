TEX_SOURCES := main.tex

all:
	pdflatex main
	bibtex main
	pdflatex main
	pdflatex main

pdf:
	evince main.pdf

commit:
	git commit -m "updated paper" -a
	git push origin master

spell: $(TEX_SOURCES)
	detex $^ | spell | env LANG=C sort -u | env LANG=C comm -23 - ok-words

clean: texi2pdf_clean latexmk_clean
	rm -f *.pdf

latexmk_clean:
	rm -f *.fls *.fdb_latexmk *.dvi

texi2pdf_clean:
	rm -rf build/
	rm -f */**.aux *.aux *.blg *.lof *.lot *.log *.bbl *.blg *.toc */**.gz *.gz
