import '../entities/news.dart';
import '../respositories/news_repository.dart';

class GetNews {
  final NewsRepository repository;

  GetNews(this.repository);

  // Execute the "get news" business operation.
  Future<List<News>> call(String category) {
    return repository.getTopHeadlines(category);
  }
}
