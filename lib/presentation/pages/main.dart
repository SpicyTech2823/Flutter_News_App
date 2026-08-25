import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home_page.dart';
import 'explore.dart';
import 'bookmark.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const Explore(),
    const Bookmark(),
  ];
  // Change the selected navigation item.
  void _onNavigationItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      // Our custom bottom navigation widget.
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,

        // Pass the function to BottomNavBar.
        onTap: _onNavigationItemSelected,
      ),
    );
  }
}