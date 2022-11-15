import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_ui/bloc/app_bloc.dart';
import 'package:registration_ui/resources/shared_preference.dart';

class AppRepository {
  Future<void> onLocaleInitAppEvent(
      LocaleInitAppEvent event, Emitter<AppState> emit) async {
    // if (await sharedPreference.authStatus == false){
      emit(LocaleInitAppState());
    // } else {
    //   await onAppStartedEvent(AppStartedEvent(), emit);
    // }
  }

  Future<void> onAppStartedEvent(
      AppStartedEvent event, Emitter<AppState> emit) async {
    emit(LoadingAppState());
    if (await isAuthenticated()) {
      emit(AuthAppState());
    } else {
      emit(UnAuthAppState());
    }
  }
  Future<void> onUserAuthedAppEvent(
      UserAuthedAppEvent event, Emitter<AppState> emit) async{
    emit(AuthAppState());
  }

  Future<bool> isAuthenticated() async{
    if (await sharedPreference.authStatus) return true;
    return false;
  }
}
