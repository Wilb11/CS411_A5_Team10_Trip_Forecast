import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi {
  final String _weatherApiKey = 'ed1a7ef1c10a4cb0b25161156230405';

  Future<Map<String, dynamic>> fetchWeather(String location) async {
    final response = await http.get(
      Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=$_weatherApiKey&q=$location&days=1',
      ),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
