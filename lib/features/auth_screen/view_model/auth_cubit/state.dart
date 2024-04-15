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

class LogOutSuccessState extends AuthState {}


class LogOutErrorState extends AuthState {}

class LogOutLoadingState extends AuthState {}

class LoginLoadingState extends AuthState {}
