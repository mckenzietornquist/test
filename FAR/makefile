# Borrowing from https://gist.github.com/ggarza/4180674 to support multiple documents

# optionally put all rnw files to be compiled to pdf here, separated by spaces
RNW_FILES= SUR-FAR.rnw

# these pdf's will be compiled from rnw files
PDFS= $(RNW_FILES:.rnw=.pdf)

# these rda files will be created from R files
# R_FILES= ../ghoti/characterisation/R/getdata.R
# RDA_FILES= $(R_FILES:.R=.rda)

.PHONY: all
.SECONDARY:
.SUFFIXES: .rnw .pdf .R .tex

# these targets will be made by default
all: $(PDFS) $(RDA_FILES)

%.pdf: %.tex
	TEXINPUTS=.///: xelatex $<
	biber  $(<:%.tex=%)
	TEXINPUTS=.///: xelatex  $<
	TEXINPUTS=.///: xelatex  $<

%.tex: %.rnw $(RDA_FILES)
	Rscript --vanilla -e "library(knitr);opts_chunk\$$set(warning=F, message = FALSE,echo=F,results='asis',fig.lp='fig:',fig.path='images/'); knit('$(<F)',output='$(@F)')"

%.rda: %.R
	Rscript --vanilla $<
