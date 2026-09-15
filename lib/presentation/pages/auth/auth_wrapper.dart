import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/presentation/pages/auth/login_page.dart';
import 'package:news_app/presentation/pages/main.dart';
import 'package:news_app/service/auth_service.dart';
import '../../providers/news_provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key, this.newsProvider});

  final NewsProvider? newsProvider;

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        // Firebase is checking authentication
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // User is logged in
        if (snapshot.hasData) {
          return Main(newsProvider: newsProvider);
        }

        // User is not logged in
        return const LoginPage();
      },
    );
  }
}
