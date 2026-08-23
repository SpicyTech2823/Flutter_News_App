import 'package:flutter/material.dart';

import '../../domain/entities/news.dart';

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display article image.
          Image.network(
            news.imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,

            // Show a placeholder when the image fails.
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox(
                height: 200,
                child: Center(
                  child: Icon(Icons.image_not_supported),
                ),
              );
            },
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Article title.
                Text(
                  news.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge,
                ),

                const SizedBox(height: 8),

                // Article description.
                Text(
                  news.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 8),

                // Publication date.
                Text(
                  news.publishedAt.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}