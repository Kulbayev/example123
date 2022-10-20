import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:registration_ui/pages/button_navbar_page.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:page_transition/page_transition.dart';

import '../model/user.dart';

// class WelcomePage extends StatelessWidget {
//
//   final User usersInfo;
//   const WelcomePage({Key? key, required this.usersInfo}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF38c172),
//       body: Stack(
//         children: [
//           Container(
//             padding: const EdgeInsets.only(
//                 top: 280, bottom: 25, right: 12, left: 30),
//             alignment: Alignment.topCenter,
//             child: Lottie.asset('assets/images/welcome.json')
//           ),
//         ],
//       ),
//     );
//   }
// }

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/images/welcome.json'),
      backgroundColor: Color(0xFF38c172),
      nextScreen: ButtonNavbarPage(),
      splashIconSize: 250,
      duration: 2100,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
