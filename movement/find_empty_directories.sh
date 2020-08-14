#!/bin/bash

# Find Directories with no files in them.

IFS=$(echo -en "\n\b"); # Allow for spaces in directory name

find ./ -type d -empty
