# Parse arguments and options
main() {
    for arg in "$@"; do
        if [[ -f "$arg" ]]; then
            dir=$(dirname "$arg")
            base=$(basename "$arg")
            new_base=$(convert_filename "$base")
            rename_file "$arg" "$dir/$new_base"
        fi
    done
    return 0
}