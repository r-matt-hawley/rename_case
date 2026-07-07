#!/usr/bin/env bash

# Create Temp files
begin() {
    temp_dir=$(mktemp -d)
    
    # Do nothing (:) and redirect output to create the file
    : > "$temp_dir/MyFile.txt"
}

# Delete the temp directory after the test
cleanup() {
    rm -rf "$temp_dir"
}

test_pascal_to_snake_one() {
    # Test converting from PascalCase to snake_case
    ./bin/rename_case "$temp_dir/MyFile.txt"
    rename_status=$?

    if [[ $rename_status -ne 0 ]]; then
        echo "FAIL: Expected exit code 0, got $rename_status"
        return 1
    fi
    
    if [[ ! -f "$temp_dir/my_file.txt" ]]; then
        echo "FAIL: File was not renamed to snake_case"
        return 1
    fi

    if [[ -f "$temp_dir/MyFile.txt" ]]; then
        echo "FAIL: Original file still exists"
        return 1
    fi

    # Test passed
    return 0
}

begin
trap cleanup EXIT
test_pascal_to_snake_one