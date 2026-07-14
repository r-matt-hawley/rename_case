# rename_case

`rename_case` is a command-line utility for safely renaming files and directories between common programming naming conventions.

The project began with support for converting `PascalCase` filesystem names to `snake_case`, with a dry-run-first philosophy that minimizes the risk of accidental renames.

## Goals

* Safe by default (dry run unless changes are explicitly accepted)
* Readable, maintainable Bash implementation
* Extensible architecture supporting multiple naming convention conversions
* Suitable as both a daily development tool and an educational Bash project

## Current Status

🚧 Early development (Milestone 1)

The project architecture has been designed, and mvp is both functional with separation of concerns and unit tested.


