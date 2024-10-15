// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:talky_app/cubits/auth_cubit/auth_state.dart';
// import 'package:talky_app/utils/auth_error_handling_messages.dart';

// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit() : super(AuthInitial());
//   Future<void> signInMethod({
//     required String email,
//     required String password,
//   }) async {
//     emit(SignInLoading());
//     try {
//       // ignore: unused_local_variable
//       final userCredential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       emit(SignInSuccess());
//     } on FirebaseAuthException catch (e) {
//       emit(SignInFailure());
//       return Future.error(handleSignInFirebaseAuthException(e));
//     } catch (e) {
//       emit(SignInFailure());
//     }
//   }

//   Future<void> signUpMethod({
//     required String email,
//     required String password,
//   }) async {
//     emit(SignUpLoading());
//     try {
//             // ignore: unused_local_variable
//             final userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       emit(SignUpSuccess());
//     } on FirebaseAuthException catch (e) {
//       emit(SignUpFailure());
//       return Future.error(handleSignInFirebaseAuthException(e));
//     } catch (e) {
//       emit(SignUpFailure());
//     }
//   }
// }
