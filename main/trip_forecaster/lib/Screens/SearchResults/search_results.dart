import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchResultsPage extends StatefulWidget {
  final String origin;
  final String destination;
  final DateTime startDate;
  final DateTime endDate;

  SearchResultsPage({
    Key? key,
    required this.origin,
    required this.destination,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  @override
  Widget build(BuildContext context) {
    String formattedStartDate =
        "${widget.startDate.year}-${widget.startDate.month.toString().padLeft(2, '0')}-${widget.startDate.day.toString().padLeft(2, '0')}";
    String formattedEndDate =
        "${widget.endDate.year}-${widget.endDate.month.toString().padLeft(2, '0')}-${widget.endDate.day.toString().padLeft(2, '0')}";

    String url =
        "https://www.kayak.com/flights/${widget.origin}-${widget.destination}/${formattedStartDate}/${formattedEndDate}?sort=bestflight_a";

    return Scaffold(
      appBar: AppBar(title: Text('Search Results')),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
