import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:registration_ui/bloc/app_bloc.dart';
import 'package:registration_ui/pages/choose_lang.dart';
import 'package:registration_ui/pages/registration_page.dart';
import 'package:registration_ui/pages/welcome_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppBloc appBloc;

  @override
  void initState() {
    // TODO: implement initState
    appBloc = AppBloc();
    appBloc.add(LocaleInitAppEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
        create: (BuildContext context) => AppBloc(),
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: BlocConsumer<AppBloc, AppState>(builder: (context, state) {
            print(state);
            if (state is UnAuthAppState) return RegistrationPage();
            print(state);

            if (state is LocaleInitAppState) return ChooseLang();
            print(state);
            if (state is AuthAppState) return WelcomePage();
            return Container(
              color: Colors.red,
            );
          }, listener: (context, state) {
            if (state is LoadingAppState) buildLoading();
          }),
        ));
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }
}
