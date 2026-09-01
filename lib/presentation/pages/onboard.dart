import 'package:flutter/material.dart';
import 'package:news_app/presentation/pages/main.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Image.asset('assets/images/world.png', width: 250, height: 250),
              const SizedBox(height: 30),
              const Text(
                'Welcome to OmniNews',
                style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold
                ),
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
                  // Navigate to the HomePage when the button is pressed.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Main()),
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
      ),
    );
  }
}
