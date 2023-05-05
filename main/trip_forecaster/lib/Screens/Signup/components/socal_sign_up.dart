import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../Login/login_screen.dart';

import '../../../screens/Signup/components/or_divider.dart';
import '../../../screens/Signup/components/social_icon.dart';

// class SocalSignUp extends StatelessWidget {
//   const SocalSignUp({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const OrDivider(),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SocalIcon(
//               iconSrc: "assets/icons/google-plus.svg",
//               press: () {},
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
class SocalSignUp extends StatelessWidget {
  const SocalSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SocalIcon(
              iconSrc: "assets/icons/google-plus.svg",
              press: () {
                // Add your onPressed() function here
                // This function will be called when the button is pressed
                print("GOOGLE FUNCTION PRESSED");
                signInWithGoogle();
              },
            ),
          ],
        ),
      ],
    );
  }

// calling the google oath through the firebase method authentication
  signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // this function will give us idToken and accessToken
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    // It will return the usercredential
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    print(userCredential.user?.displayName);

    if (userCredential.user != null) {
      Navigator.of(context as BuildContext).push(MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }
}

