import 'package:flutter/material.dart';
import 'package:trip_forecaster/Screens/Welcome/welcome_screen.dart';
import 'package:trip_forecaster/constants.dart';

// void main() => runApp(const signMain());

class signMain extends StatelessWidget {
  const signMain({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Material APP is a widget in Flutter's Material Design library 
    //that provides a pre-designed UI framework for building 
    //material design-style apps. (Build in)
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main signin_signup page',
      theme: ThemeData(
        // primary colour of the signin 
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      home: const WelcomeScreen(),
    );
  }
}
