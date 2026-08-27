import 'package:news_app/domain/usecases/get_news.dart';
import 'package:news_app/domain/entities/news.dart';
import 'package:flutter/material.dart';
class NewsProvider extends ChangeNotifier {
  final GetNews getNews;
  NewsProvider({required this.getNews});
  // store the list of news articles fetched from the API.
  List<News> newsList = [];

  /// Indicates whether an API request is currently running.
  bool isLoading = false;

  // Stores an error message when something goes wrong.
  String? errorMessage;

  Future<void> fetchNews() async {
    // Tell the UI that loading has started.
    isLoading = true;

    // Remove any previous error.
    errorMessage = null;

    // Rebuild widgets listening to this provider.
    notifyListeners();

    try {
      // Execute the use case.
      newsList = await getNews('general');
    } catch (error) {
      // Store a readable error for the UI.
      errorMessage = 'Failed to load news. Please try again.';
    } finally {
      // Loading is finished whether the request succeeded or failed.
      isLoading = false;

      // Update the UI.
      notifyListeners();
    }
  }
}
