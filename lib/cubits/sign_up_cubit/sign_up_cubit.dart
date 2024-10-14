import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talky_app/cubits/sign_up_cubit/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  Future<dynamic> signUpMethod({required String email, required String password}) async {
    emit(SignUpLoading());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignUpSuccess());
      return credential;
    } on Exception catch (e) {
      emit(SignUpFailed());
      return Future.error(e);
    }
  }
}
