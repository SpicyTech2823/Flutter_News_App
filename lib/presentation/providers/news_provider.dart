import 'package:news_app/domain/usecases/get_news.dart';
import 'package:news_app/domain/entities/news.dart';
import 'package:flutter/material.dart';

class NewsProvider extends ChangeNotifier {
  final GetNews getNews;
  NewsProvider({required this.getNews});

  List<News> newsList = [];

  bool isLoading = false;

  String? errorMessage;

  String _normalizeCategory(String category) {
    final value = category.trim().toLowerCase();
    if (value == 'all') return 'general';
    return value;
  }

  Future<void> fetchNews([String category = 'general']) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      newsList = await getNews(_normalizeCategory(category));
    } catch (_) {
      errorMessage = 'Failed to load news. Please try again.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchNewsByCategory(String category) async {
    await fetchNews(category);
  }
}
