class ProfileState {}

class UpdateProfileInitial extends ProfileState {}

class UpdateProfileLoading extends ProfileState {}

class UpdateProfileSuccess extends ProfileState {}

class UpdateProfileError extends ProfileState {
  final String error;
  UpdateProfileError(this.error);
}

class ShowProfileLoadingState extends ProfileState {}

class ShowProfileSuccessState extends ProfileState {}

class ShowProfileErrorState extends ProfileState {}

class ChangeEditingProfile extends ProfileState {}

class DeleteProfileInitState extends ProfileState {}

class DeleteProfileLoadingState extends ProfileState {}

class DeleteProfileSuccessState extends ProfileState {}

class DeleteProfileErrorState extends ProfileState {}

class ChangePasswordLoadingState extends ProfileState {}

class ChangePasswordSuccessState extends ProfileState {}

class ChangePasswordErrorState extends ProfileState {}
