#!/bin/bash

# Function to compile and run Python program
function compile_and_run_python() {
    python3 -m py_compile "$1"
    if [ $? -eq 0 ]; then
        python3 "$1"
    else
        echo "Errors occurred while compiling the Python program."
    fi
}

# Function to run Bash program
function run_bash() {
    bash "$1"
}

echo "Which type of program would you like to compile and run?"
echo "1. Python"
echo "2. Bash"
read -p "Enter your choice (1 or 2): " choice

case "$choice" in
    1)
        read -p "Enter the Python file name: " python_file
        if [ -f "$python_file" ]; then
            compile_and_run_python "$python_file"
        else
            echo "File '$python_file' not found."
        fi
        ;;
    2)
        read -p "Enter the Bash file name: " bash_file
        if [ -f "$bash_file" ]; then
            run_bash "$bash_file"
        else
            echo "File '$bash_file' not found."
        fi
        ;;
    *)
        echo "Invalid choice. Please select either 1 or 2."
        ;;
esac
