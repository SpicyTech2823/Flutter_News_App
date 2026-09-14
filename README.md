# News App

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
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```

   Select the Firebase project and the platforms you want. This generates
   `lib/firebase_options.dart` and the required platform configuration files.
4. Fetch packages and start the app:

   ```bash
   flutter pub get
   flutter run
   ```

The login page can create accounts, sign users in, and send password-reset
emails. The profile page signs users out.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
