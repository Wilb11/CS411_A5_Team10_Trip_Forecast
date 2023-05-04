// search_results_page.dart

import 'package:flutter/material.dart';
import 'flightApi.dart';
import 'weatherApi.dart';

class SearchResultsPage extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  final String origin;
  final String destination;

  SearchResultsPage({
    Key? key,
    required this.startDate,
    required this.endDate,
    required this.origin,
    required this.destination,
  }) : super(key: key);

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  late Future<Map<String, dynamic>> _flightDataFuture;
  late Future<Map<String, dynamic>> _weatherDataFuture;
  final String weatherApiKey = 'your_weather_api_key';

  @override
  void initState() {
    super.initState();
    FlightApi flightApi = FlightApi();
    _flightDataFuture = flightApi.searchFlights(
        widget.origin, widget.destination, widget.startDate.toIso8601String());
    WeatherApi weatherApi = WeatherApi(apiKey: weatherApiKey);
    _weatherDataFuture = weatherApi.fetchWeather(
        '${widget.destination},${widget.startDate.toIso8601String()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Results')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: Future.wait([_flightDataFuture, _weatherDataFuture]),
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Failed to load flight and weather data'));
          } else {
            // Display flight and weather data
            Map<String, dynamic> flightData = snapshot.data![0];
            Map<String, dynamic> weatherData = snapshot.data![1];
            return ListView.builder(
              itemCount: flightData['Quotes'].length,
              itemBuilder: (context, index) {
                var flight = flightData['Quotes'][index];
                var weather = weatherData['forecast']['forecastday'];
                return ListTile(
                  title: Text('Flight ${index + 1}: \$${flight['MinPrice']}'),
                  subtitle: Text(
                      'Weather: ${weather[0]['day']['condition']['text']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
