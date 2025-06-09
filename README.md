# 🛍️ E-Commerce App

A sleek and scalable **Flutter eCommerce** application built on top of a clean **MVVM + BLoC architecture**. The app fetches dynamic content from a RESTful API and delivers a smooth shopping experience. Includes user authentication, categorized product browsing, brand listings, cart management, favorites, and detailed item views.

---

## 🚀 Features

- **Authentication**
  - Secure login and registration.
  - Token management using local storage.

- **Home Screen**
  - Highlights categories and featured brands.
  - Banner/slider support for promotions.

- **Categories Page**
  - View and browse all product categories.
  - Filter and navigate by category.

- **Brands Page**
  - Display of brands in a visually appealing layout.

- **Favorites Page**
  - Mark/unmark products as favorite.
  - Synced with backend.

- **Cart Page**
  - Add/remove items.
  - Real-time calculation of total price and quantity.

- **Product Detail (Item) Page**
  - Full product information, images, price, and actions.

---

## 🧱 Architecture – MVVM + BLoC

This app is architected using a combination of **MVVM (Model-View-ViewModel)** and **BLoC (Business Logic Component)** patterns for clean separation of concerns, testability, and scalability.

### 🧩 MVVM Responsibilities

- **Model**: Data representation (e.g., Product, Category, User).
- **View**: UI components (widgets, screens).
- **ViewModel**: Connects business logic to the UI layer.

### ⚙️ BLoC Integration

- BLoC is used to handle state management in complex features.
- Cubits and Streams are used to manage reactive flows.
- Provides a highly testable and reactive state control mechanism.

📌 Benefits:
- Highly modular and testable.
- Clean state management with BLoC.
- Logic-UI decoupling with MVVM.
- Easy feature scalability and maintainability.

### 🛠️ CI/CD 
This project uses GitHub Actions for Continuous Integration (CI) and Continuous Deployment (CD).
Every push and pull request to the main branch automatically triggers the following steps:

✅ Automated Tasks:
Install dependencies (flutter pub get)

Analyze code (flutter analyze)

Run unit tests (flutter test)

💡 Status Badge
![Flutter CI](https://github.com/rezaqi/e-commerce-MVVM.git/actions/workflows/flutter_ci.yml/badge.svg)


---

## 🛠️ Technologies Used

| Technology               | Description                                  |
|--------------------------|----------------------------------------------|
| **Flutter**              | Cross-platform UI toolkit                    |
| **Dart**                 | Primary language                             |
| **DIO**                  | REST API communication                       |
| **Shared Preferences**   | Local storage for auth tokens                |
| **Bloc / Cubit**         | State management with business logic         |
| **MVVM Pattern**         | UI-business logic separation                 |
| **Cached Network Image** | Optimized image loading & caching            |
| **Flutter SVG**          | Support for scalable vector graphics         |

---

## 📁 Project Structure (Clean Architecture + MVVM + BLoC)

```plaintext
lib/
│
├── config.routs/               # App routes & navigation config
│
├── core/                       # Core utilities and base classes
│   ├── class/                  # Common base classes
│   └── func/                   # Shared functions/helpers
│
├── features/                   # Feature-oriented structure
│   └── auth/                   # Auth module (example)
│
│   ├── data/                   # Data layer (API / remote / local)
│   │   ├── data_source/        # Remote or local data sources
│   │   ├── model/              # DTOs / API response models
│   │   └── repository/         # Data repository implementation
│
│   ├── doman/ (domain)         # Domain layer (business logic)
│   │   ├── entity/             # Pure business models/entities
│   │   ├── repository/         # Abstract repository contracts
│   │   └── usecase/            # Application-specific use cases
│
│   └── presentation/           # Presentation layer (UI)
│       ├── manager/            # ViewModels / BLoC / Cubits
│       ├── pages/              # Screens & pages
│       └── widget/             # Reusable UI widgets
│
├── undeine_page.dart           # Placeholder or fallback page
├── di.config.dart              # Dependency injection configuration
├── di.dart                     # DI entry point / setup
└── main.dart                   # Application entry point
```
## 👨‍💻 Developer

**Rezaqi Adib**  
Expert in Flutter, Clean Architecture (MVVM), and scalable eCommerce solutions.

📬 [Connect on LinkedIn](https://www.linkedin.com/in/rezeqi) *(optional – you can provide your actual link if desired)*  
🌍 Made with ❤️ using Flutter + MVVM + Clean Architecture.
[GitHub](https://github.com/rezaqi)
