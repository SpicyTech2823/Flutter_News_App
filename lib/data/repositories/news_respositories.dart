
import 'package:news_app/domain/entities/news.dart';
// Implementation of the NewsRepository interface that fetches news data from a remote source.
abstract class NewsRepository {
  Future<List<News>> getTopHeadlines(String country);
}