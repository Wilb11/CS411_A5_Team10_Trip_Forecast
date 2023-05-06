import 'package:flutter/material.dart';
import 'package:trip_forecaster/lib/flightApi.dart';
import 'package:trip_forecaster/lib/weatherApi.dart';

class ResultsScreen extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;

  const ResultsScreen({Key? key, required this.startDate, required this.endDate}) : super(key: key);

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  List<DestinationInfo> destinations = [];

  @override
  void initState() {
    super.initState();
    fetchResults();
  }

  void fetchResults() async {
    final flightResults = await getFlightResults(widget.startDate, widget.endDate);
    List<DestinationInfo> tempDestinations = [];

    for (final flight in flightResults) {
      final weatherInfo = await getWeatherInfo(flight.destination, widget.startDate, widget.endDate);
      tempDestinations.add(DestinationInfo(
        name: flight.destination,
        flightInfo: flight.info,
        weatherInfo: weatherInfo,
      ));
    }

    setState(() {
      destinations = tempDestinations;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: ListView.builder(
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          final destination = destinations[index];
          return ListTile(
            title: Text(destination.name),
            subtitle: Text('Flight: ${destination.flightInfo}\nWeather: ${destination.weatherInfo}'),
          );
        },
      ),
    );
  }
}
