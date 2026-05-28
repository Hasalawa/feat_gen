# FeatGen - Feature-First Architecture Generator

![Dart](https://img.shields.io/badge/Built_with-Dart-0175C2?logo=dart)
![Spring Boot](https://img.shields.io/badge/Target-Spring_Boot-6DB33F?logo=spring)
![Flutter](https://img.shields.io/badge/Target-Flutter-02569B?logo=flutter)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

**FeatGen** is a lightning-fast Command Line Interface (CLI) tool designed to automate the creation of **Feature-First Architecture** structures for modern software projects.

Instead of manually creating folders and typing repetitive boilerplate code, FeatGen generates a complete, ready-to-code feature package in milliseconds. It currently supports both **Spring Boot (Java)** and **Flutter (Dart)**!

---

## ✨ Key Features

* **⚡ Instant Generation:** Generates complete feature layers for both backend and frontend instantly.
* **☕ Spring Boot Ready:** Automatically writes standard Java annotations (`@RestController`, `@Service`, `@Repository`, `@Entity`) and constructor injections.
* **📱 Flutter Ready:** Generates UI screens, state controllers, models, and API services with standard Flutter boilerplate.
* **🎯 Custom Packages:** Define your own base package dynamically using the `--package` flag.
* **🚀 Standalone Executable:** Compiled as a native `.exe` file. You don't need Dart or Java installed on your machine to run the tool!

---

## 🛠️ Installation

1. Go to the [Releases](https://github.com/Hasalawa/feat_gen/releases/tag/v1.1.0) tab of this repository.
2. Download the latest `feat_gen.exe` file.
3. Place it in a folder of your choice (e.g., `C:\tools\featgen`).
4. **Add to PATH:** Search for "Environment Variables" in Windows, edit the `Path` variable, and add the folder path where you placed `feat_gen.exe`.
5. Open a new terminal and type `feat_gen --help` to verify the installation!

*(For developers: You can also clone this repo and run `dart run bin/feat_gen.dart`)*

---

## 💻 Usage

Navigate to your project's root directory in the terminal and run the generation commands. 

### Spring Boot (Default)

Create a Spring Boot feature with a custom base package:
```bash
feat_gen create payment-gateway --package com.yourcompany.app

```

*(Or use the shorthand `-p`)*

```bash
feat_gen create order-management -p com.ecommerce.shop

```

### Flutter

Use the `--framework` or `-f` flag to target Flutter:

```bash
feat_gen create user-profile -f flutter

```

---

## 📂 What it Generates

### 1. Spring Boot Output

If you run `feat_gen create order-management -p com.shop.app`, it generates:

```text
order-management/
├── controller/
│   └── OrderManagementController.java
├── service/
│   └── OrderManagementService.java
├── repository/
│   └── OrderManagementRepository.java
├── dto/
│   ├── OrderManagementRequest.java
│   └── OrderManagementResponse.java
└── entity/
    └── OrderManagement.java

```

### 2. Flutter Output

If you run `feat_gen create user-profile -f flutter`, it generates:

```text
user-profile/
├── screens/
│   └── user_profile_screen.dart
├── controllers/
│   └── user_profile_controller.dart
├── models/
│   └── user_profile_model.dart
├── services/
│   └── user_profile_service.dart
└── widgets/

```

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!
If you'd like to help expand the template engine (e.g., adding GetX/BLoC support for Flutter, or new frameworks), please feel free to fork the repository and submit a Pull Request.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📜 License

Distributed under the MIT License. See `LICENSE` for more information.
