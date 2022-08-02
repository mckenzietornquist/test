#!/bin/bash

set -euxo  pipefail

export PGPASSWORD=${KAHAWAI_DBPASS}

psql -h ${KAHAWAI_DBHOST} -d ${KAHAWAI_DBNAME} -U ${KAHAWAI_DBUSER} -f ../ghoti/CPUE/get_data/functions.sql --set ON_ERROR_STOP=1
psql -h ${KAHAWAI_DBHOST} -d ${KAHAWAI_DBNAME} -U ${KAHAWAI_DBUSER} -f setup.sql --set ON_ERROR_STOP=1
psql -h ${KAHAWAI_DBHOST} -d ${KAHAWAI_DBNAME} -U ${KAHAWAI_DBUSER} -f ../ghoti/CPUE/get_data/cpue.sql --set ON_ERROR_STOP=1

export commithash=$(git rev-parse HEAD | grep -o "^.\{8\}")

make -j4 -f makefile
#Rscript get_data.R

if test -n "$(find . -maxdepth 1 -name '*.rda' -print -quit)"
then
    cp *.rda ${OUTPUTDIR}/.
fi

if test -n "$(find . -maxdepth 1 -name '*.RData' -print -quit)"
then
    cp *.RData ${OUTPUTDIR}/.
fi

if test -n "$(find . -maxdepth 1 -name '*.pdf' -print -quit)"
then
    cp *.pdf ${OUTPUTDIR}/.
fi

if test -n "$(find . -maxdepth 1 -name '*.csv' -print -quit)"
then
    cp *.csv ${OUTPUTDIR}/.
fi

if test -n "$(find . -maxdepth 1 -name '*.png' -print -quit)"
then
    cp *.png ${OUTPUTDIR}/.
fi

exit $?
