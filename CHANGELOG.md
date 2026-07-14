# Feature Branches

## feature/pascal-snake-one

### Completed: Create and Implement test_pascal_to_snake_one

This is the initial functionality that converts MyFile.txt to snake_case.txt. The script is monolithic.

### Completed: Refactor bin, lib

Breaks up the monolithic bin file to separate concerns:
- bin/rename_case
    1. Define and `cd` to Project root (~/.../rename_case/.)
    2. source cli, convert, and filesystem
- lib/cli.sh
    1. Parse arguments
    2. call convert_filename
    3. call rename_file
- lib/convert -- translates PascalCase or camelCase to snake_case
- lib/filesystem
    1. Verifies original file (old_path) exists
    2. If converted filename matches an extant file, warns user. Otherwise, executes file rename (`mv`).


## feature/test-abstract-setup

### Completed: Refactor test setup

Separates test file creation from testing logic.
- begin, create_test_files, and cleanup moved to tests/helpers/setup.sh

### Update Docs

CHANGELOG.md now used to record feature branches.