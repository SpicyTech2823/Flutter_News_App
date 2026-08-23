import '../../core/constants/api_constants.dart';
import '../models/news_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// A data source class responsible for fetching news data from a remote API.
class NewsRemoteDataSource {
  Future<List<dynamic>> getTopHeadlines() async {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.topHeadlinesEndpoint}?country=us&apiKey=${ApiConstants.apiKey}'),
    );
    // Extract the "articles" array from the JSON response.
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final articles = data['articles'] as List<dynamic>;
    // Convert every JSON article into a NewsModel.
    return articles
        .map(
          (article) => NewsModel.fromJson(
            article as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}
