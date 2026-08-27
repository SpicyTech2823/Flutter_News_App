class News {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String url;
  final String sourceName;
  final String category;
  final String author;
  final DateTime publishedAt;
  const News({
    required this.id,
    required this.title,
    required this.sourceName,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.author,
    required this.url,
    required this.publishedAt,
  });
}
