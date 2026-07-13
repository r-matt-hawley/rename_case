
begin() {
    temp_dir=$(mktemp -d)
}

# Create Temp files
create_test_files() {
    
    for file in "$@"; do
        # Do nothing (:) and redirect output to create the file
        : > "$temp_dir/$file"
    done
}

# Delete the temp directory after the test
cleanup() {
    rm -rf "$temp_dir"
}