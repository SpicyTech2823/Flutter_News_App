import 'package:flutter/material.dart';

import '../../domain/entities/news.dart';
import '../pages/news_detail_page.dart';

class RecommendationNewsCard extends StatelessWidget {
  final News news;

  const RecommendationNewsCard({super.key, required this.news, required Future<Null> Function() onTap});

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
        margin: const EdgeInsets.only(bottom: 12),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -----------------------------------------
            // ARTICLE IMAGE
            // -----------------------------------------
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                news.imageUrl,

                width: 110,
                height: 105,

                fit: BoxFit.cover,

                // Display an icon if the image fails.
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 110,
                    height: 105,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),

            const SizedBox(width: 12),

            // -----------------------------------------
            // ARTICLE INFORMATION
            // -----------------------------------------
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category.
                  Text(
                    news.category,
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                  ),

                  const SizedBox(height: 5),

                  // Article title.
                  Text(
                    news.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Author + date.
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          news.author,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 11,
                          ),
                        ),
                      ),

                      const SizedBox(width: 5),

                      Text('•', style: TextStyle(color: Colors.grey.shade400)),

                      const SizedBox(width: 5),

                      Text(
                        _formatDate(news.publishedAt),
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Format DateTime as "Feb 27, 2023".
  String _formatDate(DateTime date) {
    return '${_monthName(date.month)} '
        '${date.day}, ${date.year}';
  }

  String _monthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return months[month - 1];
  }
}
