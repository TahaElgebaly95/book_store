part of 'update_password_cubit.dart';

@immutable
sealed class UpdatePasswordState {}

final class UpdatePasswordInitial extends UpdatePasswordState {}

class ChangePasswordLoadingState extends UpdatePasswordState {}

class ChangePasswordSuccessState extends UpdatePasswordState {}

class ChangePasswordErrorState extends UpdatePasswordState {}

class ChangeCurrentPasswordVisibilityState extends UpdatePasswordState {}
class ChangeNewPasswordVisibilityState extends UpdatePasswordState {}
class ChangeConfirmPasswordVisibilityState extends UpdatePasswordState {}

class DeleteProfileLoadingState extends UpdatePasswordState {}

class DeleteProfileSuccessState extends UpdatePasswordState {}

class DeleteProfileErrorState extends UpdatePasswordState {}
