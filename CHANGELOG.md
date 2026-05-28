# Changelog

All notable changes to this project will be documented in this file.

## [1.1.0] - 2026-05-28

### Added
- **Full Flutter Support:** Added the ability to generate Feature-First structures for Flutter applications (`screens`, `controllers`, `models`, `services`, `widgets`).
- **Flutter Boilerplate Code:** Auto-generation of UI templates, State Controllers (ChangeNotifier), Models with JSON serialization, and API Service classes.
- **Framework CLI Flag:** Introduced the `-f` or `--framework` flag to easily switch between `spring` and `flutter` target frameworks.

### Changed
- **Codebase Language:** Translated all internal comments, variables, and console output logs to professional English to support global open-source contributors.

## [1.0.0] - 2026-05-25

- Initial version.
- Added Spring Boot feature generation (`controller`, `service`, `repository`, `dto`, `entity`).
- Added Java boilerplate injection with standard annotations.
- Added custom base package flag (`-p` or `--package`).
- Enabled standalone `.exe` compilation.