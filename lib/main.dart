import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:talky_app/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:talky_app/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:talky_app/cubits/splash_screen_cubit/splash_screen_cubit.dart';
import 'package:talky_app/firebase_options.dart';
import 'package:talky_app/screens/splash_screen.dart';
import 'package:talky_app/utils/screens_map.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TalkyApp());
}

class TalkyApp extends StatelessWidget {
  const TalkyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SignInCubit(),
            ),
            BlocProvider(
              create: (context) => SignUpCubit(),
            ),
            BlocProvider(
              create: (context) => SplashScreenCubit(),
            ),
          ],
          child: MaterialApp(
            routes: screensMap,
            debugShowCheckedModeBanner: false,
            title: 'Talky',
            home: child,
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}
