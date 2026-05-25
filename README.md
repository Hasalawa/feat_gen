# 🚀 FeatGen - Feature-First Architecture Generator

![Dart](https://img.shields.io/badge/Built_with-Dart-0175C2?logo=dart)
![Spring Boot](https://img.shields.io/badge/Target-Spring_Boot-6DB33F?logo=spring)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

**FeatGen** is a lightning-fast Command Line Interface (CLI) tool designed to automate the creation of **Feature-First Architecture** structures for modern software projects.

Instead of manually creating layers (Controllers, Services, Repositories) and typing repetitive boilerplate code, FeatGen generates a complete, ready-to-code feature package in milliseconds. Currently optimized for **Spring Boot (Java)**, with Flutter support coming soon!

---

## ✨ Key Features

* **⚡ Instant Generation:** Generates `controller`, `service`, `repository`, `dto`, and `entity` layers instantly.
* **📦 Auto Boilerplate:** Automatically writes standard Spring Boot annotations (`@RestController`, `@Service`, `@Repository`, `@Entity`) and constructor injections.
* **🎯 Custom Packages:** Define your own base package dynamically using the `--package` flag.
* **standalone Executable:** Compiled as a native `.exe` file. You don't need Dart or Java installed on your machine to run the tool!

---

## 🛠️ Installation

1. Go to the [Releases](#) tab of this repository.
2. Download the latest `feat_gen.exe` file.
3. Place it in a folder of your choice (e.g., `C:\tools\featgen`).
4. **Add to PATH:** Search for "Environment Variables" in Windows, edit the `Path` variable, and add the folder path where you placed `feat_gen.exe`.
5. Open a new terminal and type `feat_gen --help` to verify the installation!

*(For developers: You can also clone this repo and run `dart run bin/feat_gen.dart`)*

---

## 💻 Usage

Navigate to your Spring Boot project's root directory (or your base package folder) in the terminal and run:

### Basic Command (Default Package)
```bash
feat_gen create product-catalog

```

### With a Custom Base Package

```bash
feat_gen create payment-gateway --package com.yourcompany.app

```

*(Or use the shorthand `-p`)*

```bash
feat_gen create user-profile -p com.ecommerce.shop

```

---

## 📂 What it Generates

If you run `feat_gen create order-management -p com.shop.app`, it will automatically create the following structure and populate the files with valid Java code:

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

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!
If you'd like to help add **Flutter (Dart)** support to the template engine, please feel free to fork the repository and submit a Pull Request.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📜 License

Distributed under the MIT License. See `LICENSE` for more information.

```