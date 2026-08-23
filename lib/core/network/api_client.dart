import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiClient {
  // The HTTP client used to make requests to the API.
  final http.Client httpClient;
  ApiClient(this.httpClient);
  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, String>? queryParameters,
  }) async {
    // Build the complete URL including query parameters.
    final uri = Uri.parse(url).replace(
      queryParameters: queryParameters,
    );

    // Send GET request to the server.
    final response = await httpClient.get(uri);

    // Check whether the server responded successfully.
    if (response.statusCode >= 200 &&
        response.statusCode < 300) {
      // Convert JSON string into a Dart Map.
      return jsonDecode(response.body) as Map<String, dynamic>;
    }

    // Throw an exception if the server returned an error.
    throw Exception(
      'Request failed: ${response.statusCode}',
    );
  }
}