#!/bin/bash

# Take a directory of unsorted files and dump them into a child folder named by_extension. Does top-level only to preserve directory structure.
# Expected that the folder you're running this in is a bit of a mess and needs to be sorted.

IFS=$(echo -en "\n\b"); # Allow for spaces in file name
for i in $(find ./ -maxdepth 1 -type f ); do
	FILE="$i" ;
	EXTENSION="${FILE##*.}";
	mkdir -p ./by_extension/${EXTENSION} ;  # https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
	echo "mv $i ./by_extension/${EXTENSION};"
done
