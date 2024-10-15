import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:talky_app/bloc_observer.dart';
import 'package:talky_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:talky_app/cubits/auth_cubit/auth_cubit.dart';
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
  Bloc.observer = SimpleBlocObserver();
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
            // BlocProvider(
            //   create: (context) => AuthCubit(),
            // ),
            BlocProvider(
              create: (context) => AuthBloc(),
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
