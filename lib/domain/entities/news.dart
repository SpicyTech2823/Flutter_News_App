class News {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String url;
  final DateTime publishedAt;
  const News({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.url,
    required this.publishedAt,
  });
}
