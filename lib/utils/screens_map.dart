import '../screens/chat_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/sign_up_screen.dart';
import '../screens/sign_in_social_screen.dart';
import '../screens/sign_in_screen.dart';
import '../screens/splash_screen.dart';

var screensMap = {
  SplashScreen.id: (context) => const SplashScreen(),
  SignInSocialScreen.id: (context) => const SignInSocialScreen(),
  SignInScreen.id: (context) => const SignInScreen(),
  SignUpScreen.id: (context) => const SignUpScreen(),
  HomeScreen.id: (context) => const HomeScreen(),
  ChatScreen.id: (context) =>  ChatScreen(),
  ProfileScreen.id: (context) => const ProfileScreen(),
};
