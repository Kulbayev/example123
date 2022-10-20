import 'package:flutter/material.dart';
import 'package:registration_ui/button_pages/first_page.dart';
import 'package:registration_ui/button_pages/second_page.dart';
import 'package:registration_ui/button_pages/third_page.dart';



class ButtonNavbarPage extends StatefulWidget {
  const ButtonNavbarPage({Key? key}) : super(key: key);

  @override
  State<ButtonNavbarPage> createState() => _ButtonNavbarPageState();
}

class _ButtonNavbarPageState extends State<ButtonNavbarPage> {
  int pageIndex = 0;
  final pages = [
    const FirstPage(),
    const SecondPage(),
    const ThirdPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "NEWS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildButtonNavbarPage(context),
    );
  }

  Container buildButtonNavbarPage(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
          ? const Icon(Icons.newspaper,
              color: Colors.white,
              size: 35)
          : const Icon(Icons.newspaper_outlined,
              color: Colors.grey,
              size: 35,)
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(Icons.person_outline_outlined,
                  color: Colors.white,
                  size: 35)
                  : const Icon(Icons.percent_rounded,
                color: Colors.grey,
                size: 35,)
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(Icons.password,
                  color: Colors.white,
                  size: 35)
                  : const Icon(Icons.password_rounded,
                color: Colors.grey,
                size: 35,)
          )
        ],
      ),
    );
  }
}