LATEXMK = latexmk -pdf -interaction=nonstopmode

all: Casey_Dunn_CV.pdf Casey_Dunn_CV_short.pdf

Casey_Dunn_CV.pdf: Casey_Dunn_CV.tex cv_packages.tex publications.bib sections/*.tex
	$(LATEXMK) Casey_Dunn_CV.tex

Casey_Dunn_CV_short.pdf: Casey_Dunn_CV_short.tex cv_packages.tex publications.bib sections/*.tex
	$(LATEXMK) Casey_Dunn_CV_short.tex

clean:
	latexmk -C Casey_Dunn_CV.tex Casey_Dunn_CV_short.tex

.PHONY: all clean
