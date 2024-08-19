#!/bin/bash

 

declare -A seen_strings

 

for string in "$@"; do
  if [[ -n "${seen_strings[$string]}" ] then  
    echo Duplicate found: string"
    exit 0
  fi
  seen_strings["$string"]=1
done

 

echo "No duplicates found."
