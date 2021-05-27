#!/bin/bash

### Fishes Virus Searching Loop.
### Data from Travis in Zoology
### common bullies
clear
printf "Started Analysis of common bullies on: $(date).\n\n"
for SAMPLE in $(ls -d */ | grep -e "CB" | grep -v "Completed")
do
  BASE=$(echo $SAMPLE | cut -d "/" -f 1)
  printf "Processing $BASE: $(date).\n\n"
  cd $SAMPLE
  virusHunter *1.fq.gz *2.fq.gz &&
  printf "Completed $BASE: $(date).\n\n"
  cd ..
  mv $SAMPLE "$BASE"-Completed
done
printf "Completed Analysis on: $(date)"
