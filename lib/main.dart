import 'package:flutter/material.dart';

import 'data/datasources/news_remote_data_source.dart';
import 'data/repositories/news_respository_impl.dart';
import 'domain/usecases/get_news.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/providers/news_provider.dart';

void main() {
  // Create the remote data source.
  final remoteDataSource = NewsRemoteDataSource();

  // Create repository implementation.
  final repository = NewsRepositoryImpl(remoteDataSource);

  // Create the use case.
  final getNews = GetNews(repository);

  // Create the provider.
  final newsProvider = NewsProvider(getNews: getNews);

  runApp(NewsApp(newsProvider: newsProvider));
}

class NewsApp extends StatelessWidget {
  final NewsProvider newsProvider;

  const NewsApp({super.key, required this.newsProvider});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'News App',

      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),

      home: HomePage(newsProvider: newsProvider),
    );
  }
}
