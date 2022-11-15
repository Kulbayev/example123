import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:registration_ui/pages/app.dart';
import 'package:registration_ui/pages/button_navbar_page.dart';
import 'package:registration_ui/pages/choose_lang.dart';
import 'package:registration_ui/button_pages/qr_scann_page.dart';
import 'package:registration_ui/pages/registration_page.dart';
import 'package:registration_ui/resources/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'translations/codegen_loader.g.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await sharedPreference.init();
  runApp(EasyLocalization(
    child: App(),
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
