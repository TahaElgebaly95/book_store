class AuthState {}

class AuthInitState extends AuthState {}

class ChangeObscureState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterErrorState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {
  late String error;
  LoginErrorState(this.error);
}

class LoginLoadingState extends AuthState {}
