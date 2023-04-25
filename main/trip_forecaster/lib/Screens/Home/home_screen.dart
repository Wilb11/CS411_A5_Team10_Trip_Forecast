import 'package:flutter/material.dart';
import 'package:trip_forecaster/components/app_bar.dart';
import 'package:trip_forecaster/Screens/Home/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(context, isTransparent: true),
      body: Body(),
      // If you want to have something at the bellow part of the screen
      // bottomNavigationBar:,
    );
  }
}
