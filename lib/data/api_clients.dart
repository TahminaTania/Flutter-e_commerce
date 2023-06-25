import 'package:http/http.dart' as http;

class APIClient {
  final String baseUrl;

  APIClient({required this.baseUrl});

  Future<dynamic> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
