import 'package:firebase_auth/firebase_auth.dart';

Future<dynamic> signUpMethod(var email, var password) async {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email!,
    password: password!,
  );
  return credential;
}
