import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
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
          return BlocProvider(
            create: (context) => SplashScreenCubit(),
            child: MaterialApp(
              routes: screensMap,
              debugShowCheckedModeBanner: false,
              title: 'Talky',
              home: child,
            ),
          );
        },
        child: MaterialApp(
          theme: ThemeData(),
          home: const SplashScreen(),
        ));
  }
}
