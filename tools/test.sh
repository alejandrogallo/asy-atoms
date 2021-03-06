#! /usr/bin/env bash

function header()   { echo -e "\n\033[1m$@\033[0m"; }
function success()  { echo -e " \033[1;32m==>\033[0m  $@"; }
function error()    { echo -e " \033[1;31mX\033[0m  $@"; }
function arrow()    { echo -e " \033[1;34m==>\033[0m  $@"; }
function warning()  { echo -e " \033[0;93m==>\033[0m  $@"; }

TESTS_DIR=tests
FAILED=

cd ${TESTS_DIR}

for test in test_*; do
  if [[ ${test} =~ .pdf|.eps ]]; then
    continue
  fi
  header TEST: ${test}
  echo
  if [[ ${test} =~ .asy ]]; then
    asy $test && success "Success" || { error "Failed"; FAILED=1; }
  else
    ./$test && success "Success" || { error "Failed"; FAILED=1; }
  fi
done

if [[ -n ${FAILED} ]]; then
  exit 1
fi
