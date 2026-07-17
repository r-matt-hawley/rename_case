#!/usr/bin/env bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
HELPERS_DIR="$(cd -- "$SCRIPT_DIR/../helpers" && pwd)"
PROJECT_DIR="$(cd -- "$SCRIPT_DIR/../.." && pwd)"

source "$HELPERS_DIR/setup.sh"

test_snake_snake_unchanged() {
    # Test converting from snake_case to snake_case
    $PROJECT_DIR/bin/rename_case "$temp_dir/my_file.txt"
    rename_status=$?

    if [[ $rename_status -ne 0 ]]; then
        echo "FAIL: Expected exit code 0, got $rename_status."
        return $EXIT_FAILURE
    fi
    
    if [[ ! -f "$temp_dir/my_file.txt" ]]; then
        echo "FAIL: File name changed unexpectedly."
        return $EXIT_FAILURE
    fi

    # Test passed
    return $EXIT_SUCCESS
}

begin
trap cleanup EXIT
create_test_files "my_file.txt"
test_snake_snake_unchanged