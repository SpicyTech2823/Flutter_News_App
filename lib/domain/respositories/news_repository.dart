import 'dart:async';
import '../entities/news.dart';

abstract class NewsRepository {
  Future<List<News>> getTopHeadlines(String category);
}
