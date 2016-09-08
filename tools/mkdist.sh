#! /usr/bin/env bash

function header()   { echo -e "\n\033[1m$@\033[0m"; }
function success()  { echo -e " \033[1;32m==>\033[0m  $@"; }
function error()    { echo -e " \033[1;31mX\033[0m  $@"; }
function arrow()    { echo -e " \033[1;34m==>\033[0m  $@"; }

DIST_FOLDER=dist
SRC_FOLDER=src
MAIN_FILE=${SRC_FOLDER}/atoms.asy
DIST_FILE=${DIST_FOLDER}/atoms.asy

SED_TEMP_FILE=$(mktemp)

mkdir -p ${DIST_FOLDER}

arrow "Files to include..."
INCLUDED_FILES=$(sed -n "s/include\s\+\(.*\);/\1/p " ${MAIN_FILE})
SED_PROGRAM=""
echo ${INCLUDED_FILES}

for file in $INCLUDED_FILES; do \
  #SED_PROGRAM="$SED_PROGRAM -e \"/include\s\+$file/{ r ${SRC_FOLDER}/$file.asy; d}\""; \
  cat >> ${SED_TEMP_FILE} <<EOF
/include\s\+$file/ {
  r ${SRC_FOLDER}/$file.asy
  d
}
EOF

done

#arrow "Sed program"
#cat ${SED_TEMP_FILE}

sed -f ${SED_TEMP_FILE} ${MAIN_FILE} > ${DIST_FILE}



# vim-run: make dist
