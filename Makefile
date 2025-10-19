SOURCES := $(wildcard *.tex) $(wildcard src/*.tex) bibliography.bib
LATEX ?= pdflatex
OPTS += -halt-on-error 

all: clean main.pdf
main.pdf: $(SOURCES)
	$(LATEX) $(OPTS) main.tex
clean: 
	rm -f main.pdf *.aux *.bbl *.blg *.log *.out *.toc *.fls *.fdb_latexmk *.bcf *.run.xml *.synctex.gz *.nav *.snm *.vrb
	rm -fr _minted