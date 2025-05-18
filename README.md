# 📱 IUG Finder – Lost & Found App for Islamic University of Gaza


## 📌 Overview

**IUG Finder** is a mobile application built to help students and staff at the Islamic University of Gaza manage lost and found items efficiently.

## 🎯 Purpose

- Easily **report** lost/found items.
- **Browse** reported items.
- **Contact** the item owner/finder directly.

---

## 🔧 Technologies Used

- Flutter (UI)
- Dart (Programming Language)
- REST API (Backend Communication)
- Bloc (State Management)
- Dio (Networking)

---

## 🧱 App Architecture

Clean modular structure:

- **Data Layer**: API handling
- **Domain Layer**: Business logic
- **Presentation Layer**: User interface
- ![image](https://github.com/user-attachments/assets/81ad576b-98a8-4f50-adfe-56d3cf940e78)

---

## ✨ Features

- 🌐 Multi-language (Arabic supported)
- 🔌 Dependency Injection
- 🔁 REST API with Dio
- 🧭 Navigation using go_router
- 🧑‍🎨 Clean UI

---

## 📁 Project Structure
lib/

├── core/

│ ├── di/

│ ├── networking/

│ └── routing/

├── features/

│ ├── lost_items/

│ ├── found_items/

│ └── widget/

assets/

└── translations/

---
## 📁Code Organization and Feature Mapping
- The following diagram illustrates how the major features in the application map to code structures:
- ![image](https://github.com/user-attachments/assets/6e4136de-ac84-46ea-9c89-25fe069afc21)

---
## API Communication Flow
- The application communicates with a backend server through a structured API layer:
- ![image](https://github.com/user-attachments/assets/3603961b-7108-41bc-9f9f-75f7ee8010c5)

---
## Dependency Injection System
- The application uses GetIt as a service locator for dependency injection. Here's how dependencies are registered and used:
- ![image](https://github.com/user-attachments/assets/fbd164d2-9816-479f-a5d5-72fd84159d1a)


---

## 📂 Source File References

- [ar.json – Arabic Translation](https://github.com/nada-nabahin/iug_finder/blob/main/assets/translations/ar.json)
- [Dependency Injection](https://github.com/nada-nabahin/iug_finder/blob/main/lib/core/di/dependency_injection.dart)
- [API Service](https://github.com/nada-nabahin/iug_finder/blob/main/lib/core/networking/api_service.dart)
- [Routing](https://github.com/nada-nabahin/iug_finder/blob/main/lib/core/routing/app_router.dart)

---

## 👥 Contributors

- Nada
- Ghayda
- Afnan
- Dalia

---


