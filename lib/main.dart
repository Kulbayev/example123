import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:registration_ui/pages/button_navbar_page.dart';
import 'package:registration_ui/pages/choose_lang.dart';
import 'package:registration_ui/button_pages/qr_scann_page.dart';
import 'package:registration_ui/pages/registration_page.dart';
import 'translations/codegen_loader.g.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales:
    [
      Locale('kk'),
      Locale('ru'),
      Locale('en')
    ], path: 'assets/translations',
    fallbackLocale: Locale('en'),
    assetLoader: CodegenLoader(),),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/images/splash.json'),
      backgroundColor: Color(0xFF93CBF5),
      nextScreen: ButtonNavbarPage(),
      splashIconSize: 250,
      duration: 2900,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
    );
  }
}


//TODO Lateinitialization в ProfileMainPage
//TODO Поменять навбар заготовка есть
//TODO shared pref, поменять ui под один дизайн
