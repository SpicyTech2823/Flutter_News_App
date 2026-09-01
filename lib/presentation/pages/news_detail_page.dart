import 'package:flutter/material.dart';
import '../../domain/entities/news.dart';
import '../../domain/respositories/bookmark_repository.dart';

class NewsDetailPage extends StatefulWidget {
  final News news;
  const NewsDetailPage({super.key, required this.news});
  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  final BookmarkRepository _bookmarkRepository = BookmarkRepository();
  bool _isBookmarked = false;
  // Get the news article from the widget
  News get news => widget.news;
  @override
  void initState() {
    super.initState();
    _isBookmarked = _bookmarkRepository.isBookmarked(widget.news.id);
  }

  // Toggle bookmark status for the news article
  Future<void> _toggleBookmark() async {
    await _bookmarkRepository.toggleBookmark(widget.news);
    setState(() {
      _isBookmarked = !_isBookmarked;
    });
    // Show a snackbar to indicate the action
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _isBookmarked ? 'Added to bookmarks' : 'Removed from bookmarks',
          ),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        leadingWidth: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            Text(
              'News Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                foregroundColor: Colors.black,
              ),
              onPressed: _toggleBookmark,
              icon: Icon(
                _isBookmarked ? Icons.bookmark : Icons.bookmark_add_outlined,
                color: _isBookmarked ? Colors.blue : Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Image.network(
              news.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 250,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image_not_supported),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      news.category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Title
                  Text(
                    news.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Source and time
                  Row(
                    children: [
                      Text(
                        news.sourceName,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text('•', style: TextStyle(color: Colors.grey.shade400)),
                      const SizedBox(width: 8),
                      Text(
                        _getTimeAgo(news.publishedAt),
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Description
                  Text(
                    news.description,
                    style: const TextStyle(fontSize: 16, height: 1.6),
                  ),
                  const SizedBox(height: 16),

                  // URL Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        // TODO: Open URL in browser
                      },
                      child: const Text('Read Full Article'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${dateTime.year}-${dateTime.month}-${dateTime.day}';
    }
  }
}
