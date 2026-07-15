#!/usr/bin/env bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
HELPERS_DIR="$(cd -- "$SCRIPT_DIR/../helpers" && pwd)"
PROJECT_DIR="$(cd -- "$SCRIPT_DIR/../.." && pwd)"

source "$HELPERS_DIR/setup.sh"

test_pascal_to_snake_one() {
    # Test converting from PascalCase to snake_case
    $PROJECT_DIR/bin/rename_case "$temp_dir/MyFile.txt"
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
create_test_files "MyFile.txt"
test_pascal_to_snake_one