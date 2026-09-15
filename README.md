# 📰 NEWS App — Flutter

A modern **Flutter News Application** that allows users to discover, search, read, and bookmark the latest news. The project is built with **Clean Architecture** to keep the code organized, scalable, testable, and easy to maintain.

The app also includes **Firebase Authentication** so users can register/login and remain authenticated between app launches.

---

## 📱 Overview

**NEWS App** is a mobile news application built with Flutter that fetches real-time news from **NewsAPI** and provides users with a clean and simple reading experience.

Users can:

* 🔐 Register and log in
* 👤 Store user account information with Firebase
* 🔄 Stay logged in after closing/reopening the app
* 📰 Browse the latest news
* 🔍 Search and explore news
* 🗂️ Filter news by category
* 📖 Read detailed news articles
* 🔖 Bookmark articles
* 💾 Store bookmarks locally using Hive
* 🚪 Log out securely

---

## ✨ Features

### 🔐 Authentication

* User registration
* User login
* Firebase Authentication
* Persistent login session
* Logout functionality
* Firebase user information storage

### 📰 News

* Fetch latest news from NewsAPI
* Display news headlines
* News image
* News source
* Author
* Published date
* News description
* Open original article

### 🔎 Explore

Users can explore news through:

* Search
* All News
* Business
* Entertainment
* General
* Health
* Science
* Sports
* Technology

### 🔖 Bookmark

Users can save interesting articles for later.

Bookmarks are stored locally using **Hive**, allowing saved articles to remain available even when the application is restarted.

### 🎨 User Interface

* Clean and modern UI
* Bottom navigation
* News cards
* News detail screen
* Category tabs
* Search interface
* Bookmark screen
* Authentication screens

---

# 🏗️ Architecture

This project follows **Clean Architecture** principles.

```text
lib/
│
├── core/
│   ├── constants/
│   ├── error/
│   ├── network/
│   └── utils/
│
├── data/
│   ├── datasources/
│   │   ├── news_remote_data_source.dart
│   │   └── bookmark_local_data_source.dart
│   │
│   ├── models/
│   │   └── news_model.dart
│   │
│   └── repositories/
│       ├── news_repository_impl.dart
│       └── bookmark_repository_impl.dart
│
├── domain/
│   ├── entities/
│   │   └── news.dart
│   │
│   ├── repositories/
│   │   ├── news_repository.dart
│   │   └── bookmark_repository.dart
│   │
│   └── usecases/
│
├── presentation/
│   ├── pages/
│   │   ├── home/
│   │   ├── explore/
│   │   ├── bookmark/
│   │   ├── detail/
│   │   ├── login/
│   │   └── register/
│   │
│   ├── widgets/
│   │   ├── news_card.dart
│   │   └── recommended_news_card.dart
│   │
│   └── ...
│
└── main.dart
```

---

# 🧠 Clean Architecture

The application is divided into three main layers.

### 1. Presentation Layer

Responsible for:

* UI
* Pages
* Widgets
* User interactions
* Displaying application state

```text
Presentation
     ↓
Use Cases
```

### 2. Domain Layer

Contains the application's core business logic.

```text
Domain
├── Entities
├── Repositories
└── Use Cases
```

The domain layer does not depend directly on Flutter, Firebase, Hive, or NewsAPI.

### 3. Data Layer

Responsible for communicating with external data sources.

```text
Data
├── Models
├── Remote Data Sources
├── Local Data Sources
└── Repository Implementations
```

For example:

```text
NewsAPI
   ↓
NewsRemoteDataSource
   ↓
NewsModel
   ↓
NewsRepository
   ↓
Use Case
   ↓
Presentation
```

---

# 🔥 Firebase Authentication

Firebase Authentication is used for user accounts.

### Authentication Flow

```text
User
 │
 ├── Register
 │      ↓
 │   Firebase Authentication
 │      ↓
 │   User Account
 │
 └── Login
        ↓
     Firebase
        ↓
   Authenticated
        ↓
     Home Page
```

Firebase Authentication also provides persistent authentication, so users do not need to log in every time they reopen the application unless they explicitly log out.

---

# 🌐 News API

The application uses **NewsAPI** to retrieve news articles.

Example request:

```text
GET /v2/top-headlines
```

The application can request news by category:

```text
country=us
category=technology
```

The returned JSON data is converted into a `NewsModel`.

Example:

```text
NewsAPI
   ↓
JSON Response
   ↓
NewsModel.fromJson()
   ↓
News Entity
   ↓
UI
```

---

# 🔖 Local Bookmark System

The application uses **Hive** for local bookmark storage.

```text
User taps Bookmark
        ↓
Bookmark Repository
        ↓
Hive Local Storage
        ↓
Saved Article
```

When the user opens the Bookmark page:

```text
Hive
 ↓
Bookmark Repository
 ↓
Saved News
 ↓
Bookmark Screen
```

This allows bookmarked articles to remain available after restarting the application.

---

# 🛠️ Technologies Used

| Technology              | Purpose                      |
| ----------------------- | ---------------------------- |
| Flutter                 | Mobile application framework |
| Dart                    | Programming language         |
| Firebase Authentication | User authentication          |
| Cloud Firestore         | User data storage            |
| NewsAPI                 | News data                    |
| Hive                    | Local bookmark storage       |
| HTTP                    | API requests                 |
| Clean Architecture      | Application architecture     |
| Git & GitHub            | Version control              |

---

# 📦 Main Dependencies

Some important packages used in this project include:

```yaml
dependencies:
  flutter:
    sdk: flutter

  http:
  firebase_core:
  firebase_auth:
  cloud_firestore:
  hive:
  hive_flutter:
```

> Check `pubspec.yaml` for the exact package versions used by the project.

---

# 🚀 Getting Started

## 1. Clone the repository

```bash
git clone https://github.com/SpicyTech2823/news_app.git
```

Move into the project:

```bash
cd news_app
```

---

## 2. Install dependencies

```bash
flutter pub get
```

---

## 3. Configure NewsAPI

Create an API key from NewsAPI.

Then configure your API key in the project's API constants/environment configuration.

Example:

```dart
class ApiConstants {
  static const String baseUrl = 'https://newsapi.org/v2/';
  static const String apiKey = 'YOUR_API_KEY';
}
```

⚠️ **Do not commit your real API key to GitHub.**

For a production application, use a secure environment/configuration strategy.

---

# 🔥 Configure Firebase

Create a Firebase project and connect it to your Flutter application.

Run:

```bash
flutterfire configure
```

This generates the Firebase configuration required by the Flutter application.

Make sure Firebase Authentication is enabled in the Firebase Console.

Enable:

```text
Authentication
    ↓
Sign-in method
    ↓
Email/Password
```

If the application uses Firestore for user information, also create a Firestore database.

---

# ▶️ Run the Application

Check connected devices:

```bash
flutter devices
```

Run the application:

```bash
flutter run
```

For a specific device:

```bash
flutter run -d <device-id>
```

---

# 📸 Application Screens

Add your application screenshots here.

Example:

```text
screenshots/
├── login.png
├── register.png
├── home.png
├── explore.png
├── news_detail.png
└── bookmark.png
```

Then add them to this README:

```markdown
## 📸 Screenshots

| Login | Home |
|---|---|
| ![Login](screenshots/login.png) | ![Home](screenshots/home.png) |

| Explore | Bookmark |
|---|---|
| ![Explore](screenshots/explore.png) | ![Bookmark](screenshots/bookmark.png) |
```

---

# 🔄 Application Flow

```text
                    ┌───────────────┐
                    │     Start     │
                    └───────┬───────┘
                            │
                            ▼
                  ┌──────────────────┐
                  │ Check Auth State │
                  └────────┬─────────┘
                           │
              ┌────────────┴────────────┐
              │                         │
          Logged In                 Logged Out
              │                         │
              ▼                         ▼
        ┌───────────┐           ┌────────────┐
        │   Home    │           │ Login /    │
        │   Page    │           │ Register   │
        └─────┬─────┘           └──────┬─────┘
              │                        │
              │                        ▼
              │                   Firebase Auth
              │                        │
              └────────────┬───────────┘
                           ▼
                    ┌──────────────┐
                    │ NewsAPI Data │
                    └──────┬───────┘
                           │
             ┌─────────────┼──────────────┐
             ▼             ▼              ▼
          Home          Explore        Bookmark
             │             │              │
             └─────────────┼──────────────┘
                           ▼
                     News Detail
```

---

# 📚 What I Learned

Through this project, I practiced:

* Flutter application development
* Dart programming
* Clean Architecture
* REST API integration
* JSON parsing
* Repository pattern
* Local data persistence
* Hive
* Firebase Authentication
* Firebase/Firestore integration
* State management
* Navigation
* Search functionality
* Category filtering
* Git & GitHub
* Debugging Flutter applications
* Organizing scalable Flutter projects

---

# 🎯 Future Improvements

Planned improvements include:

* [ ] Dark mode
* [ ] Pagination / infinite scrolling
* [ ] Better error handling
* [ ] Offline news caching
* [ ] Push notifications
* [ ] Personalized news recommendations
* [ ] Multiple language support
* [ ] User profile
* [ ] Reading history
* [ ] Share news
* [ ] Unit tests
* [ ] Widget tests
* [ ] CI/CD pipeline

---

# 👨‍💻 Developer

**Sakirin Sles**

IT Engineering Student
Royal University of Phnom Penh

### GitHub

https://github.com/SpicyTech2823

### Portfolio

https://portfolio-neon-xi-mnktudz2pn.vercel.app/

---

# ⭐ Support

If you find this project useful or interesting, consider giving the repository a ⭐ on GitHub.

---

## 📄 License

This project is developed for **educational and portfolio purposes**.

