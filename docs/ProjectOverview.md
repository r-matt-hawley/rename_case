# Project Overview

## Purpose

`rename_case` is a reusable command-line utility for converting filesystem object names between common programming naming conventions.

Although the initial motivation is converting `PascalCase` project structures to Python-style `snake_case`, the project is intentionally designed so that additional naming convention conversions can be added later without changing the traversal or filesystem logic.

Examples of possible conversions include:

- PascalCase → snake_case
- snake_case → PascalCase
- PascalCase → camelCase
- camelCase → snake_case

## Design Philosophy

This project emphasizes:

- Safety before convenience
- Readability before cleverness
- Small, composable functions
- Separation of concerns
- Professional Bash conventions
- Incremental development

The utility should be something I can maintain comfortablly as needed rather than a one-off script (even though it started that way).

## Primary Design Decisions

### Dry Run by Default

The utility never modifies the filesystem unless the user explicitly supplies:

```
--accept-changes
```

This is the project's most important safety feature.

### Scope

Milestone 1 operates only on the current directory.

Later milestones will introduce recursive traversal.

### Hidden Files

Hidden files and directories are ignored.

Examples include:

```
.git
.env
.vscode
```

Support for hidden files may be considered in a future release but is intentionally omitted from the initial implementation.

### File Extensions

Everything following the first period (`.`) is treated as part of the extension and remains unchanged.

Examples:

```
MyFile.py
    → my_file.py

MyArchive.tar.gz
    → my_archive.tar.gz
```

If this conservative approach fails to rename part of an uncommon filename, that is considered preferable to accidentally modifying a legitimate extension.

### Collision Policy

The utility never overwrites an existing filesystem object.

If a collision occurs:

1. report the conflict,
2. skip the rename, and
3. continue processing,

exiting with a non-zero status.

### Safety Restrictions

The utility should refuse to operate from dangerous locations such as:

- the filesystem root,
- the user's home directory,
- any directory above the user's designated workspace.

The default behavior should encourage intentional, project-level usage rather than system-wide execution.

### Project Structure

```
rename_case/
├── .gitignore
├── CHANGELOG.md
├── LICENSE
├── README.md
├── bin/
│   └── rename_case
├── docs/
│   └── ProjectOverview.md
├── journal/
│   ├── DesignLog.md
│   ├── FutureIdeas.md
│   ├── SessionNotes.md
├── lib/
│   ├── cli.sh
│   ├── constants.sh
│   ├── convert.sh
│   └── filesystem.sh
└── tests/
```

## Milestones

### Milestone 1

Current directory only.

Features:

- PascalCase → snake_case conversion
- dry run by default
- `--accept-changes`
- rename files
- rename directories (but not subdirectories)
- ignore hidden filesystem objects
- preserve extensions
- collision detection
- formatted output

---

### Milestone 2

Filesystem traversal.

Features:

- recursive traversal
- `--max-depth=k`
- ignored directory list
- directory rename ordering
- filesystem access restricted to at or below:
    - ~/Downloads
    - ~/Documents
    - ~/Desktop

---

### Milestone 3

Generalization.

Features:

- additional naming convention conversions
- automated tests
- expanded documentation
- packaging improvements
- long-term maintainability

## Educational Goals

This repository also serves as a guided introduction to professional Bash development.

Topics expected to be explored include:

- executable project layout
- shell function organization
- argument parsing
- robust filename handling
- exit codes
- defensive programming
- testing shell utilities
- Unix command-line conventions
