import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:registration_ui/pages/registration_page.dart';

class ChooseLang extends StatefulWidget {
  const ChooseLang({Key? key}) : super(key: key);

  @override
  State<ChooseLang> createState() => _ChooseLangState();
}

class _ChooseLangState extends State<ChooseLang> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF93CBF5)
      ),
      home: Scaffold(
        body: Center(
            child: Column(
              children: [
                SizedBox(height: 200,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF4FC3F7),
                        fixedSize: Size(320, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                    onPressed: () async{
                      await context.setLocale(Locale('en'));
                        Navigator.push( context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationPage(),
                          ),
                        );
                    }, child:Text("ENGLISH") ),
                SizedBox(height: 100,),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF4FC3F7),
                        fixedSize: Size(320, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                    onPressed: () async{
                      await context.setLocale(Locale('ru'));
                      Navigator.push( context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationPage(),
                        ),
                      );
                    }, child:Text("РУССКИЙ") ),
                SizedBox(height: 100,),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF4FC3F7),
                        fixedSize: Size(320, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                    onPressed: () async{
                      await context.setLocale(Locale('kk'));
                      Navigator.push( context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationPage(),
                        ),
                      );
                    }, child:Text("КАЗАХСКИЙ") ),

              ],
            )
        ),
      ),
    );
  }
}