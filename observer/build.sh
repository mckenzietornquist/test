#!/bin/bash

set -euo  pipefail

export PGPASSWORD=${KAHAWAI_DBPASS}


psql -h ${KAHAWAI_DBHOST} -d ${KAHAWAI_DBNAME} -U ${KAHAWAI_DBUSER} -f setup.sql --set ON_ERROR_STOP=1
psql -h ${KAHAWAI_DBHOST} -d ${KAHAWAI_DBNAME} -U ${KAHAWAI_DBUSER} -f ../ghoti/observer/sql/observer-data.sql --set ON_ERROR_STOP=1

set -x
export commithash=$(git rev-parse HEAD | grep -o "^.\{8\}")

Rscript --vanilla ../ghoti/observer/R/obsdata.R

if test -n "$(find . -maxdepth 1 -name '*.RData' -print -quit)"
then
    cp *.RData ${OUTPUTDIR}/.
fi

if test -n "$(find . -maxdepth 1 -name '*.rda' -print -quit)"
then
    cp *.rda ${OUTPUTDIR}/.
fi


exit $?
