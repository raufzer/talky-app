import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../utils/auth_error_handling_messages.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is SignInEvent) {
        emit(SignInLoading());
        try {
          // ignore: unused_local_variable
          final userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(SignInSuccess());
        } on FirebaseAuthException catch (e) {
          emit(SignInFailure());
          return Future.error(handleSignInFirebaseAuthException(e));
        } catch (e) {
          emit(SignInFailure());
        }
      }
      if (event is SignUpEvent) {
        emit(SignUpLoading());
        try {
          // ignore: unused_local_variable
          final userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(SignUpSuccess());
        } on FirebaseAuthException catch (e) {
          emit(SignUpFailure());
          return Future.error(handleSignInFirebaseAuthException(e));
        } catch (e) {
          emit(SignUpFailure());
        }
      }
    });
  }
}
