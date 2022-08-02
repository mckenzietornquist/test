 #these rda files will be created from R files

RDA_FILES= cpue.rda 
.PHONY: all

# these targets will be made by default
all: $(RDA_FILES)

XXX.rda: ../ghoti/CPUE-ML/run_model.R cpue.rda
	SPEC='XXX' 
	OUTPUTFILE=$@ Rscript --vanilla $<

cpue.rda: ../ghoti/CPUE-ML/get_data/get_data.R
	Rscript --vanilla $<
