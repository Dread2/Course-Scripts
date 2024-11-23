#!/bin/bash

# Check if a PDF file was provided as an argument
if [ -z "$1" ]; then
    echo "Usage: ./title PDF_FILE"
    exit 1
fi

# The PDF file path (handle spaces or quotes properly)
PDF_FILE="$1"

# Check if the PDF file exists
if [ ! -f "$PDF_FILE" ]; then
    echo "File not found: $PDF_FILE"
    exit 1
fi

# Convert the PDF to text and search for "Lecture X: TITLE" format, 
# and only output the TITLE part (ignoring "Lecture X:")

lecture_title=$(pdftotext "$PDF_FILE" - | grep -Po 'Lecture \d+: \K[^\n]+')

echo $lecture_title
