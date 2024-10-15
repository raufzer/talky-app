// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  SignInEvent({
    required this.email,
    required this.password,
  });
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  SignUpEvent({
    required this.email,
    required this.password,
  });
}
