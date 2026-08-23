import 'dart:async';
import 'package:news_app/domain/entities/news.dart';
class NewsRepository {
  Future<List<News>> getTopHeadlines(String country) {
    // This method is intended to be overridden by subclasses.
    throw UnimplementedError();
  }
}