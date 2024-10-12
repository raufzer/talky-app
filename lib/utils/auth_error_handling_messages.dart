import 'package:firebase_auth/firebase_auth.dart';

String handleSignInFirebaseAuthException(FirebaseAuthException e) {
  switch (e.code) {
    case 'user-not-found':
      return 'User not found. Please check your email address.';
    case 'wrong-password':
      return 'Incorrect password. Please try again.';
    case 'invalid-email':
      return 'Invalid email address. Please enter a valid email.';
    case 'weak-password':
      return 'Password too weak. Please use a stronger password.';
    case 'email-already-in-use':
      return 'Email address is already in use.';
    case 'operation-not-allowed':
      return 'Email address is disabled. Please contact support.';
    default:
      return 'There was an error signing in. Please try again later.';
  }
}

String handleSignUpFirebaseAuthException(FirebaseAuthException e) {
  switch (e.code) {
    case 'email-already-in-use':
      return 'Email address is already in use. Please try another email.';
    case 'weak-password':
      return 'Password too weak. Please use a stronger password.';
    case 'invalid-email':
      return 'Invalid email address. Please enter a valid email.';
    case 'operation-not-allowed':
      return 'Email address is disabled. Please contact support.';
    default:
      return 'There was an error signing up. Please try again later.';
  }
}