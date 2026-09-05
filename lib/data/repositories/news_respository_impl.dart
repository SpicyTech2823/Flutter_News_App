import '../../domain/entities/news.dart';
import '../../domain/respositories/news_repository.dart';
import '../datasources/news_remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<News>> getTopHeadlines(String category) async {
    final news = await remoteDataSource.getTopHeadlines('us', category);
    return List<News>.from(news);
  }

  Future<List<News>> searchNews(String query) async {
    final news = await remoteDataSource.searchNews(query);
    return List<News>.from(news);
  }
}
