import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi {
  final String apiKey;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final http.Client httpClient = http.Client();

  WeatherApi({required this.apiKey});

  Future<Map<String, dynamic>> fetchWeather(String query) async {
    final response = await httpClient.get(
      Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$query&days=3'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}