import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talky_app/cubits/splash_screen_cubit/splash_screen_states.dart';

class SplashScreenCubit extends Cubit<SplashState> {
  SplashScreenCubit() : super(SplashInitial()); 


  void startTimer() {
    Future.delayed(const Duration(seconds: 10), () {
      emit(SplashSuccess());
    });
  }
}