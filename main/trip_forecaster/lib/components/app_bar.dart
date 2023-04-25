import 'package:flutter/material.dart';
import '../constants.dart';
import '../signMain.dart';

// this is the top part of the main web the three options and the sign in page
AppBar buildAppBar(BuildContext context,
    {bool isTransparent = false, String title = ''}) {
  return AppBar(
    backgroundColor: isTransparent ? Colors.transparent : Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        color: kPrimaryColor,
      ),
      onPressed: () {},
    ),
    title: !isTransparent
        ? Text(
            isTransparent ? "" : title,
            style: TextStyle(color: kTextColor),
          )
        : null,
    centerTitle: true,
    actions: [
      // IconButton(
      //   icon: ClipOval(child: Image.asset("assets/images/profile.png")),
      //   onPressed: () {},
      // )
      //   ElevatedButton(
      //   onPressed: () {
      //     // Handle sign-in logic here
      //   },
      //   child: Text('Sign in'),
      // )
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return signMain();
              },
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          // elevation: 0,
          shape: RoundedRectangleBorder(
            // Adjust the value for the oval shape
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: Size(50, 20),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          primary: kPrimaryColor,
        ),
        child: Text('Sign in'),
      ),
    ],
  );
}
