#!/bin/bash

set -euo  pipefail

export PGPASSWORD=${KAHAWAI_DBPASS}
# psql -h ${KAHAWAI_DBHOST} -d ${KAHAWAI_DBNAME} -U ${KAHAWAI_DBUSER} -f ../CPUE-ML/setup.sql --set ON_ERROR_STOP=1

set -x
export commithash=$(git rev-parse HEAD | grep -o "^.\{8\}")

make -f makefile

if test -n "$(find . -maxdepth 1 -name '*.RData' -print -quit)"
then
    cp *.RData ${OUTPUTDIR}/.
fi

if test -n "$(find . -maxdepth 1 -name '*.tex' -print -quit)"
then
    cp *.tex ${OUTPUTDIR}/.
fi

if test -n "$(find . -maxdepth 1 -name '*.pdf' -print -quit)"
then
    cp *.pdf ${OUTPUTDIR}/.
fi

if test -n "$(find . -maxdepth 1 -name '*.csv' -print -quit)"
then
#    cp *.csv ${OUTPUTDIR}/.
    zip ${OUTPUTDIR}/indices.zip *.csv
fi

if test -n "$(find . -maxdepth 1 -name '*.png' -print -quit)"
then

    #cp *.png ${OUTPUTDIR}/.
    zip ${OUTPUTDIR}/indicesfigs.zip *.png
fi

# if test -n "$(find . -maxdepth 1 -name '*.png' -print -quit)"
# then
#     cp *.png ${OUTPUTDIR}/.
# fi
#
# if test -n "$(find . -maxdepth 1 -name '*.png' -print -quit)"
# then
#     cp *.png ${OUTPUTDIR}/.
#fi

if test -n "$(find . -maxdepth 1 -name 'fig' -print -quit)"
then
    zip -r figures.zip fig
    cp figures.zip ${OUTPUTDIR}/.
fi

exit $?
