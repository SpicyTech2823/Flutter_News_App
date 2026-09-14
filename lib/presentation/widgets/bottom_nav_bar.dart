import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home, color: Colors.lightBlue),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.explore_outlined),
          selectedIcon: Icon(Icons.explore,  color: Colors.lightBlue),
          label: 'Explore',
        ),
        NavigationDestination(
          icon: Icon(Icons.bookmark_add_outlined),
          selectedIcon: Icon(Icons.bookmark,  color: Colors.lightBlue),
          label: 'Bookmark',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person,  color: Colors.lightBlue),
          label: 'Profile',
        ),
      ],
    );
  }
}
