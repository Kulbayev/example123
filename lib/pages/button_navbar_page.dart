import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:registration_ui/button_pages/news_page.dart';
import 'package:registration_ui/button_pages/profile_main_page.dart';
import 'package:registration_ui/button_pages/qr_scann_page.dart';
import 'package:registration_ui/button_pages/map_page.dart';
import 'package:registration_ui/model/user.dart';
import 'package:registration_ui/translations/locale_keys.g.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';


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
    // ProfileMainPage(userInfo: User(),),

  ];
  //
  // final items =const[
  //   Icon(Icons.newspaper,size: 40,color: Colors.white,),
  //   Icon(Icons.qr_code_rounded,size: 40,color: Colors.white,),
  //   Icon(Icons.map,size: 40,color: Colors.white,)
  //
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          LocaleKeys.appbarNews.tr(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.elliptical(700, 50),
              bottomLeft: Radius.elliptical(700, 50)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF38c172),
      ),
      body: pages[pageIndex],
      // bottomNavigationBar: buildButtonNavbarPage(
      //   items: items,
      //   index: pageIndex,
      //   onTap: (selectedIndex){
      //     setState(() {
      //       pageIndex = selectedIndex;
      //     });
      //   },
      //   height: 50,
      //   backgroundColor:Colors.transparent.withOpacity(0),
      //   color: Color(0xFF38c172),
      //   animationDuration: const Duration(milliseconds: 300),
      // ),
      bottomNavigationBar: buildButtonNavbarPage(context),
    );
  }

  Container buildButtonNavbarPage(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          color: Color(0xFF38c172),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(45),
            topLeft: Radius.circular(45),
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
              color: Color(0xFFBDBDBD),
              size: 35,)
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  // pageIndex = 1;
                  Navigator.push( context,
                    MaterialPageRoute(
                      builder: (context) => QrScannPage(),
                    ),
                  );
                });
              },
              icon: pageIndex == 1
                  ? const Icon(Icons.qr_code_outlined,
                  color: Colors.white,
                  size: 35)
                  : const Icon(Icons.qr_code_rounded,
                color: Color(0xFFBDBDBD),
                size: 35,)
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(Icons.map_outlined,
                  color: Colors.white,
                  size: 35)
                  : const Icon(Icons.map_rounded,
                color: Color(0xFFBDBDBD),
                size: 35,)
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? const Icon(Icons.person_pin_rounded,
                  color: Colors.white,
                  size: 35)
                  : const Icon(Icons.person_pin_outlined,
                color: Color(0xFFBDBDBD),
                size: 35,)
          ),
        ],
      ),
    );

  }
}
