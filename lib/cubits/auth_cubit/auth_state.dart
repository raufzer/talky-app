abstract class AuthState {}

class AuthInitial extends AuthState {}



class SignUpInitial extends AuthState {}

class SignUpSuccess extends AuthState {}

class SignUpFailure extends AuthState {}

class SignUpLoading extends AuthState {}



class SignInSuccess extends AuthState {}

class SignInFailure extends AuthState {}

class SignInLoading extends AuthState {}
