import 'package:news_app/domain/entities/news.dart';
class NewsModel extends News{
  const NewsModel({
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.sourceName,
    required super.category,
    required super.author,
    required super.url,
    required super.publishedAt,
  });
  // converts a JSON object into a NewsModel instance.
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['url'] as String? ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      sourceName: (json['source'] as Map<String, dynamic>?)?['name'] as String? ?? 'Unknown source',
      imageUrl: json['urlToImage'] ?? '',
      author: json['author'] as String? ?? 'Unknown author',
      category: json['category'] as String? ?? 'General',
      url: json['url'] ?? '',
      publishedAt: DateTime.parse(json['publishedAt'] ?? DateTime.now().toIso8601String()),
    );
  }
}
