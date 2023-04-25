import 'package:flutter/material.dart';
import '../../responsive.dart';
import 'search_fields.dart';

// this is the top part of the home page
class HomeHeader extends StatelessWidget {
  // const HomeHeader({
  //   required Key key,
  // }) : super(key: key);
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenWidth(25)),
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/images/home_bg.png",
          fit: BoxFit.cover,
          width: double.infinity,
          height: getProportionateScreenHeight(315),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenHeight(80)),
            Text(
              "Travelers",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(73),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 0.5),
            ),
            Text(
              "Travel suggestion app",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        Positioned(
          bottom: getProportionateScreenWidth(-25),
          child: SearchField(),
        )
      ],
    ),
    );
  }
}
