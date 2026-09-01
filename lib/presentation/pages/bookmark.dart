import 'package:flutter/material.dart';
import '../../domain/respositories/bookmark_repository.dart';
import '../../domain/entities/news.dart';
import 'news_detail_page.dart';
import '../widgets/recommendation_news_card.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  final BookmarkRepository _bookmarkRepository = BookmarkRepository();
  List<News> _bookmarkedNews = [];
  @override
  void initState() {
    super.initState();
    _loadBookmarkedNews();
  }

  void _loadBookmarkedNews() {
    setState(() {
      _bookmarkedNews = _bookmarkRepository.getAllBookmarks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bookmarks',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: _bookmarkedNews.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bookmark_border, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No bookmarks yet',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _bookmarkedNews.length,
              itemBuilder: (context, index) {
                final news = _bookmarkedNews[index];
                return RecommendationNewsCard(
                  news: news,
                  key: ValueKey(news.id),
                  // Navigate to the news detail page when tapped
                  // Navigate to the news detail page when tapped
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailPage(news: news),
                      ),
                    ).then((_) {
                      // Reload bookmarks when returning from the detail page
                      _loadBookmarkedNews();
                    });
                  },
                );
              },
            ),
    );
  }
}
