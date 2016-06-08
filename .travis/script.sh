#!/usr/bin/env bash

set -e

go get -t ./...
if [ ${TESTMODE} == "unit" ]; then
  ginkgo -r --cover --randomizeAllSpecs --randomizeSuites --trace --progress --skipPackage integrationtests
fi

if [ ${TESTMODE} == "integration" ]; then
  COUNTER=0
  while [  $COUNTER -lt $REPITITIONS ]; do
     ginkgo -r --randomizeAllSpecs --randomizeSuites --trace --progress integrationtests
     let COUNTER=COUNTER+1
  done
fi
