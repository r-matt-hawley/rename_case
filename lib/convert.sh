# Case conversion algorithms
convert_filename() {
    local name="$1"

    echo "$name" |
        sed -E 's/([a-z0-9])([A-Z])/\1_\L\2/g' |
        tr '[:upper:]' '[:lower:]'
}