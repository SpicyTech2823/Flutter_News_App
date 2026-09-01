import 'package:hive/hive.dart';
import '../../domain/entities/news.dart';

part 'bookmark_model.g.dart';

@HiveType(typeId: 0)
class BookmarkModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String imageUrl;

  @HiveField(4)
  final String sourceName;

  @HiveField(5)
  final String category;

  @HiveField(6)
  final String author;

  @HiveField(7)
  final String url;

  @HiveField(8)
  final DateTime publishedAt;

  BookmarkModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.sourceName,
    required this.category,
    required this.author,
    required this.url,
    required this.publishedAt,
  });

  // Convert News entity → BookmarkModel
  factory BookmarkModel.fromNews(News news) {
    return BookmarkModel(
      id: news.id,
      title: news.title,
      description: news.description,
      imageUrl: news.imageUrl,
      sourceName: news.sourceName,
      category: news.category,
      author: news.author,
      url: news.url,
      publishedAt: news.publishedAt,
    );
  }

  // Convert BookmarkModel → News entity
  News toNews() {
    return News(
      id: id,
      title: title,
      description: description,
      imageUrl: imageUrl,
      sourceName: sourceName,
      category: category,
      author: author,
      url: url,
      publishedAt: publishedAt,
    );
  }
}