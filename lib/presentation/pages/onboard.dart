import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/presentation/pages/auth/auth_wrapper.dart';
import 'package:news_app/presentation/pages/main.dart';
import 'package:news_app/presentation/providers/news_provider.dart';

class OnboardPage extends StatelessWidget {
  final NewsProvider? newsProvider;

  const OnboardPage({super.key, this.newsProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Image.asset('assets/images/world.png', width: 250, height: 250),
            const SizedBox(height: 30),
            const Text(
              'Welcome to OmniNews',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Stay updated with the latest news from around the world.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                final nextPage = FirebaseAuth.instance.currentUser == null
                    ? AuthWrapper(newsProvider: newsProvider)
                    : Main(newsProvider: newsProvider);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => nextPage),
                );
              },
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
