#!/usr/bin/env bash

set -e

cat coverage.out > coverage.txt
cat frames/coverage.out
cat frames/coverage.out | grep -v "mode: set" >> coverage.txt
cat coverage.txt
