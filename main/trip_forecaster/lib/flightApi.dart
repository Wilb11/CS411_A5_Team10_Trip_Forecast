import 'dart:convert';
import 'package:http/http.dart' as http;

class FlightApi {
  final String baseUrl = 'https://partners.api.skyscanner.net/apiservices';

  Future<Map<String, dynamic>> searchFlights(String origin, String destination, String departureDate) async {
    final response = await http.get(
      Uri.parse('$baseUrl/browsequotes/v1.0/US/USD/en-US/$origin/$destination/$departureDate'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load flight data');
    }
  }
}

