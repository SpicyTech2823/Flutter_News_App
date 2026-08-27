import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../providers/news_provider.dart';
import '../../data/datasources/news_remote_data_source.dart';
import '../../data/repositories/news_respository_impl.dart';
import '../../domain/usecases/get_news.dart';
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
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(
        newsProvider: NewsProvider(
          getNews: GetNews(NewsRepositoryImpl(NewsRemoteDataSource())),
        ),
      ),
      const Explore(),
      const Bookmark(),
    ];
  }

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
