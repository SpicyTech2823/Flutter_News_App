import '../../core/constants/api_constants.dart';
import '../models/news_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// A data source class responsible for fetching news data from a remote API.
class NewsRemoteDataSource {
  Future<List<NewsModel>> getTopHeadlines(String country, String category) async {
    final queryParameters = {
      'country': country,
      'category': category,
      'apiKey': ApiConstants.apiKey,
    };
    if(category.isNotEmpty) {
      queryParameters['category'] = category;
    }
    final url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.topHeadlinesEndpoint}?${Uri(queryParameters: queryParameters).query}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body)['articles'];
      return jsonList.map((json) => NewsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
  // Search News
 Future<List<NewsModel>> searchNews(String query) async {
    final queryParameters = <String, String>{
      'q': query,
      'language': 'en',
      'sortBy': 'publishedAt',
      'pageSize': '20',
      'apiKey': ApiConstants.apiKey,
    };

    final uri = Uri.parse(
      '${ApiConstants.baseUrl}'
      '${ApiConstants.everythingEndpoint}',
    ).replace(
      queryParameters: queryParameters,
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception(
        'News search failed (${response.statusCode}).',
      );
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;

    final articles = data['articles'] as List<dynamic>? ?? [];

    return articles
        .map(
          (article) => NewsModel.fromJson(
            article as Map<String, dynamic>,
          ),
        )
        .toList(growable: false);
  }
}
