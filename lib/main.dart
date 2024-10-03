import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:talky_app/cubits/splash_screen_cubit/splash_screen_cubit.dart';
import 'package:talky_app/screens/splash_screen.dart';

void main() async {
  await dotenv.load();
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
