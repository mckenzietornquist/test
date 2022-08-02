#!/bin/bash

set -euo  pipefail

export PGPASSWORD=${KAHAWAI_DBPASS}

psql -h ${KAHAWAI_DBHOST} -d ${KAHAWAI_DBNAME} -U ${KAHAWAI_DBUSER} -f ../ghoti/characterisation/sql/functions.sql --set ON_ERROR_STOP=1
psql -h ${KAHAWAI_DBHOST} -d ${KAHAWAI_DBNAME} -U ${KAHAWAI_DBUSER} -f setup.sql --set ON_ERROR_STOP=1
psql -h ${KAHAWAI_DBHOST} -d ${KAHAWAI_DBNAME} -U ${KAHAWAI_DBUSER} -f ../ghoti/characterisation/sql/characterisation.sql --set ON_ERROR_STOP=1

# Uncomment the next four lines, and set project code, to produce data archive for MPI
# psql -h ${KAHAWAI_DBHOST} -d ${KAHAWAI_DBNAME} -U ${KAHAWAI_DBUSER} -f ../ghoti/CPUE/get_data/functions.sql --set ON_ERROR_STOP=1
# #psql -h ${KAHAWAI_DBHOST} -d ${KAHAWAI_DBNAME} -U ${KAHAWAI_DBUSER} -f ../ghoti/CPUE/get_data/cpue.sql --set ON_ERROR_STOP=1
# psql -h ${KAHAWAI_DBHOST} -d ${KAHAWAI_DBNAME} -U ${KAHAWAI_DBUSER} -f archive.sql --set ON_ERROR_STOP=1 --set PROJECT_CODE="XXX"
# zip ${OUTPUTDIR}/groomed-data.zip *.csv

#cp *.csv ${OUTPUTDIR}/.

set -x
export commithash=$(git rev-parse HEAD | grep -o "^.\{8\}")

Rscript --vanilla ../ghoti/characterisation/R/getdata.R

if test -n "$(find . -maxdepth 1 -name '*.RData' -print -quit)"
then
    cp *.RData ${OUTPUTDIR}/.
fi

if test -n "$(find . -maxdepth 1 -name '*.rda' -print -quit)"
then
    cp *.rda ${OUTPUTDIR}/.
fi

exit $?
