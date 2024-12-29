import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/data/network/helper/dio_helper.dart';
import '../../../../../core/data/network/helper/endpoints.dart';
part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit() : super(UpdatePasswordInitial());

  static UpdatePasswordCubit get(context) => BlocProvider.of(context);

  bool isCurrentPasswordVisible = true;
  bool isNewPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  void changeCurrentPasswordVisibility() {
    isCurrentPasswordVisible = !isCurrentPasswordVisible;
    emit(ChangeCurrentPasswordVisibilityState());
  }

  void changeNewPasswordVisibility() {
    isNewPasswordVisible = !isNewPasswordVisible;
    emit(ChangeNewPasswordVisibilityState());
  }

  void changeConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(ChangeConfirmPasswordVisibilityState());
  }

  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> changePassword() async {
    emit(ChangePasswordLoadingState());
    await DioHelper.post(
      endpoint: EndPoints.updatePassword,
      withToken: true,
      body: {
        "current_password": currentPasswordController.text,
        "new_password": newPasswordController.text,
        "new_password_confirmation": confirmPasswordController.text
      },
    ).then(
      (value) {
        emit(ChangePasswordSuccessState());
      },
    ).catchError(
      (error) {
        emit(ChangePasswordErrorState());
        throw error;
      },
    );
  }

  void resetPassword() {
    currentPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  Future<void> deleteProfile() async {
    emit(DeleteProfileLoadingState());
    await DioHelper.post(
            endpoint: EndPoints.deleteAccount,
            withToken: true,
            body: {"current_password": currentPasswordController.text})
        .then((value) {
      emit(DeleteProfileSuccessState());
    }).catchError((error) {
      emit(DeleteProfileErrorState());
      throw error;
    });
  }
}
