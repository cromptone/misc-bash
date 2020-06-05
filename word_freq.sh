#!/bin/bash

# Largely lifted from StackOverflow


input_file=${1}
date_in_secs=`date +%s`
output_file="${input_file%.*}_word_freq_${date_in_secs}.txt"

if [ $# -eq 0 ]; then
    echo "No arguments provided. Provide as argument the file you want counted"
    exit 1
elif [ ! -f "$input_file" ]; then
    echo "Error: file ${input_file} doesn't exist."
    exit 1
elif [ ! "${input_file##*.}" = "txt" ]; then
    echo "Error: for now only .txt file types are supported. Copy-paste into a .txt file"
    exit 1
fi


tr '[:punct:]' ' ' < "$input_file" \
| tr 'A-Z' 'a-z'                   \
| tr '\t' ' '                      \
| tr -s ' '                        \
| tr ' ' '\n'                      \
| sort                             \
| uniq -c                          \
| sort -rn >> ${output_file};

open "$output_file"
