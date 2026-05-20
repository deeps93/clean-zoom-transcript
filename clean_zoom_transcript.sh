#!/bin/bash

# Pass the transcript that needs to be cleaned up as the argument

if [ -z "$1" ]; then
  echo "Error: Transcript file argument missing"
  echo "Usage: $0 <transcript_file>"
  exit 1
fi

file_name="$1"

prev_name=""
while read p; do
# Find lines beginning with "<name>:..."
# Ignores all other lines like '00:00:52.337 --> 00:00:55.539' 
    if [[ "$p" =~ ^[aA-zZ].*: ]]
    then
      name=$(echo $p | cut -d ":" -f 1)
      # If the name is different from the previous name,
      # print line with name.
      if [ "$name" != "$prev_name" ]
      then
         echo -e "\n${p%$'\r'}"
      # If the name is the same as the previous one,
      # remove the name and print the line. 
      else
        name2=$name":"
        np=${p/"$name2"/""}
        echo "${np%$'\r'}"
      fi
      prev_name="$name"
    fi
done < $file_name
