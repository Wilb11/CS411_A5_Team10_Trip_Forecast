import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../SearchResults/search_results.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  DateTime? _startDate;
  DateTime? _endDate;
  TextEditingController originController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  Future<void> _openDatePicker(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().add(Duration(days: 14)),
      lastDate: DateTime.now().add(Duration(days: 300)),
    );
    if (picked != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
      });

      // Navigate to SearchResultsPage with user input
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResultsPage(
            startDate: _startDate!,
            endDate: _endDate!,
            origin: originController.text, // Use the user's origin input
            destination:
                destinationController.text, // Use the user's destination input
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: originController,
          decoration: InputDecoration(labelText: 'Origin'),
        ),
        TextField(
          controller: destinationController,
          decoration: InputDecoration(labelText: 'Destination'),
        ),
        GestureDetector(
          onTap: () => _openDatePicker(context),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Color(0xFF3E4067),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(3, 3),
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.16),
                  spreadRadius: -2,
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      _startDate != null && _endDate != null
                          ? '${DateFormat('MM/dd/yyyy').format(_startDate!)} - ${DateFormat('MM/dd/yyyy').format(_endDate!)}'
                          : "Select the date range you are looking to travel...",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF464A7E),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _openDatePicker(context),
                    child: Icon(Icons.calendar_today),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
