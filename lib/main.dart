import 'package:flutter/material.dart';
import 'package:news_app/presentation/pages/onboard.dart';
void main() {
  runApp(OnboardScreen());
}

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardPage() 
    );
  }
}

