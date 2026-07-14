# Case conversion algorithms
convert_filename() {
    local name="$1"

    # Convert PascalCase to snake_case.
    # sed: Insert underscore before uppercase letters that are
    #      preceded by lowercase letters or digits.
    # tr: Translate all uppercase letters to lowercase.
    echo "$name" |
        sed -E 's/([a-z0-9])([A-Z])/\1_\L\2/g' |
        tr '[:upper:]' '[:lower:]'
}