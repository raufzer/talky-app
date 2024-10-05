import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talky_app/cubits/splash_screen_cubit/splash_screen_cubit.dart';
import 'package:talky_app/cubits/splash_screen_cubit/splash_screen_states.dart';
import 'package:talky_app/screens/sign_in_screen.dart';
import 'package:talky_app/utils/constants.dart';
import 'package:talky_app/widgets/talky_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = '/SplashScreen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SplashScreenCubit>(context).startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF377DFF),
      body: BlocListener<SplashScreenCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashSuccess) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const SignInScreen()));
          }
        },
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TalkyLogo(
              textColor: primaryColor,
              dotColor: Color(0xFF243443),
              textSize: 65,
              dotSize: 15,
              sizedBoxDot: 55,
            ),
          ],
        ),
      ),
    );
  }
}
