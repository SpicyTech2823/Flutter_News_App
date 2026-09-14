import 'package:flutter/material.dart';
import 'package:news_app/core/local_storage/hive_service.dart';
import 'package:news_app/domain/usecases/get_news.dart';
import 'package:news_app/presentation/pages/auth/auth_wrapper.dart';
import 'package:news_app/presentation/providers/news_provider.dart';

import 'data/datasources/news_remote_data_source.dart';
import 'data/repositories/news_respository_impl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await HiveService.init();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key, this.newsProvider});

  final NewsProvider? newsProvider;

  @override
  Widget build(BuildContext context) {
    final provider =
        newsProvider ??
        NewsProvider(
          getNews: GetNews(NewsRepositoryImpl(NewsRemoteDataSource())),
        );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthWrapper(newsProvider: provider),
    );
  }
}
