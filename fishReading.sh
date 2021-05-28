#!/bin/bash

### Fishes palmReader Searching Loop.
### Data from Travis in Zoology
### Two species of Fishes, Common Bullies and Common Smelt
clear
printf "Started palmReading of Smelt and Bullies on: $(date).\n\n"
for SAMPLE in $(ls -d */)
do
  BASE=$(echo $SAMPLE | cut -d "/" -f 1)
  printf "Processing $BASE: $(date).\n\n"
  cd $SAMPLE
  palmReader *1.fq.gz *2.fq.gz &&
  cd ..
done

