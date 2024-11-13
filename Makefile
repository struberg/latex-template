MAIN=wissarb1

all: pdf

.PHONY: dist-clean clean all
clean:
	find . -type f -name '*.aux' -delete
	rm -f $(MAIN).lof
	rm -f $(MAIN).log
	rm -f $(MAIN).lot
	rm -f $(MAIN).toc
	rm -f $(MAIN).bbl
	rm -f $(MAIN).bcf
	rm -f $(MAIN).blg
	rm -f $(MAIN).acn
	rm -f $(MAIN).acr
	rm -f $(MAIN).alg
	rm -f $(MAIN).glg
	rm -f $(MAIN).glo
	rm -f $(MAIN).gls
	rm -f $(MAIN).glsdefs
	rm -f $(MAIN).ist
	rm -f $(MAIN).run.xml
	rm -f $(MAIN)-blx.bib
	rm -f $(MAIN).lol
	rm -f $(MAIN).out
	rm -f $(MAIN)-plantuml*
	rm -rf svg-inkscape

dist-clean: clean
	rm -f $(MAIN).pdf

pdf:
	lualatex -halt-on-error --shell-escape $(MAIN).tex
	biber $(MAIN)
#	makeglossaries $(MAIN)
	lualatex -halt-on-error --shell-escape $(MAIN).tex
