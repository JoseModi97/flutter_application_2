import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client _client;

  ApiClient(this._client);

  Future<http.Response> get(String url) async {
    return await _client.get(Uri.parse(url));
  }

  Future<http.Response> post(String url, dynamic body) async {
    return await _client.post(
      Uri.parse(url),
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<http.Response> put(String url, dynamic body) async {
    return await _client.put(
      Uri.parse(url),
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<http.Response> delete(String url) async {
    return await _client.delete(Uri.parse(url));
  }
}
