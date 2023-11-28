#!/bin/bash

# Check
if [ $# -ne 1 ]; then
    echo "Usage: $0 <source_file.cpp>"
    exit 1
fi

# Get the source file path from the first argument
source_file="$1"

# Check if the file exists
if [ ! -f "$source_file" ]; then
    echo "Error: $source_file not found."
    exit 1
fi

# Determine if it's a C or C++ source file
if [[ "$source_file" == *.c ]]; then
    compiler="gcc"
elif [[ "$source_file" == *.cpp ]]; then
    compiler="g++"
else
    echo "Error: Unsupported file extension. Only .c and .cpp files are supported."
    exit 1
fi

# Compile the source file
if ! $compiler "$source_file" -o "${source_file%.*}"; then
    echo "Compilation failed."
    exit 1
fi

# Run the compiled program
echo "Compilation successful. Running the program..."
"./${source_file%.*}"
