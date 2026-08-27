import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../domain/entities/news.dart';
import '../pages/news_detail_page.dart';

class BreakingNewsCard extends StatelessWidget {
  const BreakingNewsCard({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsDetailPage(news: news)),
        );
      },
      child: Container(
        height: 220,
        // add rounds corner
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          // Prevent image from escaping
          image: DecorationImage(
            image: NetworkImage(news.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.8),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 7,
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
                  ),
                ),
              ),
            ),

            // -----------------------------------------
            // ARTICLE INFORMATION
            // -----------------------------------------
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Source + time.
                  Row(
                    children: [
                      Text(
                        news.sourceName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(width: 8),

                      const Text('•', style: TextStyle(color: Colors.white70)),

                      const SizedBox(width: 8),

                      Text(
                        _getTimeAgo(news.publishedAt),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Main article title.
                  Text(
                    news.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
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

  // Convert publication time into something like:
  // "2 hours ago"
  String _getTimeAgo(DateTime date) {
    final difference = DateTime.now().difference(date);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    }

    if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    }

    return '${difference.inDays} days ago';
  }
}
