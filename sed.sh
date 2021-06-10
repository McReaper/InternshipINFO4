#!/bin/bash
FILES="*.ml"
for f in $FILES
do
  if [ -f "$f" ] # Check if "$f" FILE exists and is a regular file
  then
    echo "Processing $f file...";
    sed 's/imap /List.iter /g' $f -i; 
    sed 's/for_each /List.iter /g' $f -i; 
    sed 's/mapi /List.mapi /g' $f -i; 
    sed 's/map /List.map /g' $f -i; 
    sed 's/filter /List.filter /g' $f -i; 
    sed 's/find /List.find /g' $f -i; 
    sed 's/head /List.hd /g' $f -i; 
    sed 's/tail /List.tl /g' $f -i; 
    sed 's/car /List.hd /g' $f -i; 
    sed 's/cdr /List.tl /g' $f -i; 
    sed -r 's/(\b[^_#]|\(\b)at /\1List.nth /g' $f -i; 
    sed -r 's/isEmpty (\b[^ ]+\b)/List.length \1 = 0/g' $f -i; 
  fi
done