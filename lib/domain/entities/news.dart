class News {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String articleUrl;
  final DateTime publishedAt;
  const News({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.articleUrl,
    required this.publishedAt,
  });
}
