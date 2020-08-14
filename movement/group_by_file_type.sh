#!/bin/bash

# Script to take files in a given directory and group them in subfolder by file type. This is to keep items like audio files (i.e. wav, mp3, etc.) in one bucket.
# Requires a regex matching the output of file (see manpage for more information) and will move into a directory with the file name bucketed by extension.

IFS=$(echo -en "\n\b"); # Allow Spaces in File Names

for i in $(find ./ -maxdepth 1 -type f); do 

	FILENAME=$i ; 
	TYPE=`file --brief --mime-type $FILENAME` ; 

	# PDFs and other misc files will be named something like "application/pdf" 
	# and we only care about the extension type for these.
	if [[ $TYPE = application* ]]; then 
		TYPE=`echo $TYPE | cut -f2 -d\/` ; 
	else 
		TYPE=`echo $TYPE | cut -f1 -d\/`; 
	fi; 

	mkdir -p $TYPE; 
	mv $i $TYPE/ ; 
done
