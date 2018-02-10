##########################
## Makefile
##########################

LATEX ?= latex
BIBTEX ?= bibtex
DVIPS ?= dvips
PS2PDF ?= ps2pdf
PDFVIEWER ?= acroread
SED ?= /bin/sed

all: cv.pdf

clean:
	rm -f *log *aux *blg *bbl *dvi cv.pdf *ps *~ *toc *nav *out *snm

cv.dvi: cv.tex
#cv.bib
	$(LATEX) cv.tex
#	$(BIBTEX) cv
#	$(LATEX) cv.tex
	$(LATEX) cv.tex

cv.aux: cv.tex
	$(LATEX) cv.tex

cv.bbl: cv.aux
	$(BIBTEX) cv.aux

cv.ps: cv.dvi cv.aux
	$(DVIPS) -t letter -o cv.ps cv.dvi


cv.pdf: cv.ps
	$(PS2PDF) cv.ps

cv.pdfview: cv.pdf
	"$(PDFVIEWER)" cv.pdf

