#!/usr/bin/env bash

FILENAME=$1
OUTPUT=$2

# i don't know if this is supposed to be more complicated
# uses time to time the sort
# sorts numerically by the first entry in each row
time sort -n -k1,1 $FILENAME > $OUTPUT