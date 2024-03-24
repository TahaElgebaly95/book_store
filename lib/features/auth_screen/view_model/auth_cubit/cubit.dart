import 'package:book_store/core/data/local/shared_helper.dart';
import 'package:book_store/core/data/local/shared_keys.dart';
import 'package:book_store/core/data/network/helper/dio_helper.dart';
import 'package:book_store/core/data/network/helper/endpoints.dart';
import 'package:book_store/core/utils/show_toast.dart';
import 'package:book_store/features/auth_screen/view_model/auth_cubit/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitState());

  static AuthCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emilaController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  bool obscure = true;
  bool confirmObscure = true;

  void changeObscure() {
    obscure = !obscure;
    emit(ChangeObscureState());
  }

  void changeConfirmObscure() {
    confirmObscure = !confirmObscure;
    emit(ChangeObscureState());
  }

  Future<void> register() async {
    emit(RegisterLoadingState());
    await DioHelper.post(endpoint: EndPonits.register, withToken: true, body: {
      "name": nameController.text,
      "email": emilaController.text,
      "password": passwordController.text,
      "password_confirmation": conPasswordController.text
    }).then((value) {
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error);
      if (error is DioException) {
        customShowToast(error.response?.data['message'] ?? 'Register Error');
      }
      emit(RegisterErrorState());
      throw error;
    });
  }

  Future<void> login() async {
    emit(LoginLoadingState());
    await DioHelper.post(endpoint: EndPonits.login, withToken: true, body: {
      "email": emilaController.text,
      "password": passwordController.text
    }).then((value) async {
      await SharedHelper.set(
          key: SharedKey.token, value: value.data['data']['token']);
      await SharedHelper.set(
          key: SharedKey.userID, value: value.data['data']['user']['id']);
      await SharedHelper.set(
          key: SharedKey.userEmail, value: value.data['data']['user']['email']);
      await SharedHelper.set(
          key: SharedKey.userName, value: value.data['data']['user']['name']);
      print(value.data);
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.response?.data.toString());
      if (error is DioException) {
        customShowToast(error.response?.data['message'] ?? 'Login Error');
      }
      emit(LoginErrorState(error.response?.data['message'] ?? 'Error'));
      throw error;
    });
  }
}
