#!/bin/bash

# Function to validate a 4-digit input
validate_input() {
    local input=$1
    if [[ ! $input =~ ^[0-9]{4}$ ]]; then
        echo "Error: Please enter a valid 4-digit number."
        exit 1
    fi
}

# Function to perform Kaprekar's routine
kaprekar_routine() {
    local num=$1
    local iterations=0

    echo "Starting Kaprekar's Routine for: $num"

    # Continue until we reach 6174
    while [ "$num" -ne 6174 ]; do

        # Pad number with leading zeros if necessary
        num=$(printf "%04d" $num)

        # Sort digits in ascending and descending order
        asc=$(echo "$num" | grep -o . | sort | tr -d '\n')
        desc=$(echo "$num" | grep -o . | sort -r | tr -d '\n')

        # Convert to decimal to prevent octal errors
        asc=$((10#$asc))
        desc=$((10#$desc))

        # Calculate the new number
        num=$((desc - asc))

        # Increment iteration counter
        ((iterations++))

        echo "Iteration $iterations: $desc - $asc = $num"

        # Handle special case: If all digits are the same, it leads to 0
        if [ "$num" -eq 0 ]; then
            echo "Reached 0 - Kaprekar's routine cannot continue."
            exit 0
        fi
    done

}

# Main program: Get input from user
read -p "Enter a 4-digit number: " input_number

# Validate the input
validate_input $input_number

# Run the Kaprekar routine
kaprekar_routine $input_number
