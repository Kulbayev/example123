import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../model/user.dart';

class WelcomePage extends StatelessWidget {

  final User usersInfo;
  const WelcomePage({Key? key, required this.usersInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF38c172),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 280, bottom: 25, right: 12, left: 30),
            alignment: Alignment.topCenter,
            child: Lottie.asset('assets/images/welcome.json')
          ),
        ],
      ),
    );
  }
}
