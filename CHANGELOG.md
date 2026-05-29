# Changelog

All notable changes to this project will be documented in this file.

## [1.2.0] - 2026-05-29

### Added
- **Database Architecture Flag:** Introduced the `--db` flag to specify the target database architecture (supports `jpa` and `firebase`).
- **Firebase for Spring Boot:** Auto-generation of Firestore-ready Repository classes and POJO Entities when using `--db firebase`.
- **Firebase for Flutter:** Auto-generation of Service classes equipped with `cloud_firestore` CRUD operations when using `-f flutter --db firebase`.
- **Enhanced Help Menu:** Updated the `--help` command output to display command-specific options dynamically, along with new practical usage examples.

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