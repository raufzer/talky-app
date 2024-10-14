abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInSuccess extends SignInState {}
class SignInFailure extends SignInState {
  
}
class SignInLoading extends SignInState {}
