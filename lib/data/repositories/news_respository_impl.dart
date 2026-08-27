import '../../domain/entities/news.dart';
import '../../domain/respositories/news_repository.dart';
import '../datasources/news_remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<News>> getTopHeadlines(String category) async {
    // Ask the data source for news.
    final news = await remoteDataSource.getTopHeadlines(category);

    // Return the data as domain entities.
    return List<News>.from(news);
  }
}
