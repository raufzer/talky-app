import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talky_app/cubits/sign_in_cubit/sign_in_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:talky_app/utils/auth_error_handling_messages.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  Future<UserCredential> signInMethod(
      {required String email, required String password}) async {
    emit(SignInLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignInSuccess());
      return credential;
    } on FirebaseAuthException catch (e) {
      emit(SignInFailure());
      return Future.error(handleSignInFirebaseAuthException(e));
      
    } catch (e) {
      emit(SignInFailure());
      return Future.error(e);
    }
  }
}
