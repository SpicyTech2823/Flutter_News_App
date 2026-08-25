import 'package:news_app/domain/entities/news.dart';
class NewsModel extends News{
  const NewsModel({
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.url,
    required super.publishedAt,
  });
  // converts a JSON object into a NewsModel instance.
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
      url: json['url'] ?? '',
      publishedAt: DateTime.parse(json['publishedAt'] ?? DateTime.now().toIso8601String()),
    );
  }
}