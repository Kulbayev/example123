import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:registration_ui/features/news/ui/page/news_page.dart';
import 'package:registration_ui/features/profile/ui/page/profile_page.dart';
import 'package:registration_ui/features/qr/ui/page/qr_scann_page.dart';
import 'package:registration_ui/features/map/ui/page/map_page.dart';
import 'package:registration_ui/constants/colors.dart';

import '../features/exampleList/ui/page/example_list_page.dart';

class ButtonNavbarPage extends StatefulWidget {
  const ButtonNavbarPage({Key? key}) : super(key: key);

  @override
  State<ButtonNavbarPage> createState() => _ButtonNavbarPageState();
}

class _ButtonNavbarPageState extends State<ButtonNavbarPage> {
  int pageIndex = 0;
  final pages = [
    FirstPage(),
    QrScannPage(),
    MapGoogle(),
    ProfilePage(),
    ExampleListPage()
  ];

  final items = const [
    Icon(
      Icons.newspaper,
      size: 40,
      color: Colors.black54,
    ),
    Icon(
      Icons.qr_code_rounded,
      size: 40,
      color: Colors.black54,
    ),
    Icon(
      Icons.map,
      size: 40,
      color: Colors.black54,
    ),
    Icon(
      Icons.account_box,
      size: 40,
      color: Colors.black54,
    ),
    Icon(
      Icons.assignment_sharp,
      size: 40,
      color: Colors.black54,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PeachMainView,
      body: pages[pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: pageIndex,
        onTap: (selectedIndex) {
          setState(() {
            pageIndex = selectedIndex;

            if (pageIndex == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QrScannPage()));
            }

            if (pageIndex == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MapGoogle()));
            }
            print(pageIndex);
          });
        },
        height: 50,
        backgroundColor: Colors.transparent.withOpacity(0),
        color: Colors.white,
        animationDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
