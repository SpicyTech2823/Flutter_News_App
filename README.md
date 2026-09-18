# News App

## Screenshots

<p align="center">
  <img src="assets/screenshot/Screenshot%202026-09-18%20232631.png" width="180" alt="News App screenshot 1" />
  <img src="assets/screenshot/Screenshot%202026-09-18%20232649.png" width="180" alt="News App screenshot 2" />
  <img src="assets/screenshot/Screenshot%202026-09-18%20232709.png" width="180" alt="News App screenshot 3" />
  <img src="assets/screenshot/Screenshot%202026-09-18%20232736.png" width="180" alt="News App screenshot 4" />
</p>

<p align="center">
  <img src="assets/screenshot/Screenshot%202026-09-18%20232744.png" width="180" alt="News App screenshot 5" />
  <img src="assets/screenshot/Screenshot%202026-09-18%20232752.png" width="180" alt="News App screenshot 6" />
  <img src="assets/screenshot/Screenshot%202026-09-18%20232759.png" width="180" alt="News App screenshot 7" />
</p>

## Firebase Authentication setup

The app uses Firebase Authentication with email and password. Before running it,
connect this Flutter project to your Firebase project:

1. In the [Firebase console](https://console.firebase.google.com/), open your
   **news app flutter** project and add an Android app. Use the Android package
   name `com.example.news_app` (or change `applicationId` in
   `android/app/build.gradle.kts` first if you want a different package name).
2. In **Authentication** → **Sign-in method**, enable **Email/Password**.
3. Install the FlutterFire CLI once, then configure this project:

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

