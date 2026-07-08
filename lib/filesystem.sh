# Safe rename operations
rename_file() {
    local old_path="$1"
    local new_path="$2"

    if [[ -f "$old_path" ]]; then
        if [[ -f "$new_path" || -d "$new_path" ]]; then
            echo "Warning: Target file '$new_path' already exists. $old_path not renamed."
        else
            mv "$old_path" "$new_path"
        fi
    fi
}