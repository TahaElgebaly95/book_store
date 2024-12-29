import 'package:book_store/core/data/local/shared_helper.dart';
import 'package:book_store/core/data/local/shared_keys.dart';
import 'package:book_store/core/data/network/helper/dio_helper.dart';
import 'package:book_store/core/data/network/helper/endpoints.dart';
import 'package:book_store/features/profile_screen/view_model/cubits/profile_cubit/profile_state.dart';
import 'package:book_store/features/profile_screen/view_model/cubits/update_password_cubit/update_password_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(UpdateProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  void resetProfile() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    cityController.clear();
    addressController.clear();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  GlobalKey<FormState> profileKey = GlobalKey<FormState>();

  bool isEditing = false;

  void changeEditingProfile() {
    isEditing = !isEditing;

    emit(ChangeEditingProfile());
  }

  Future<void> updateProfile() async {
    emit(UpdateProfileLoading());
    await DioHelper.post(
        endpoint: EndPoints.updateProfile,
        withToken: true,
        body: {
          'name': nameController.text,
          'email': emailController.text,
          'phone': phoneController.text,
          'city': cityController.text,
          'address': addressController.text
        }).then((value) {
      SharedHelper.set(
          key: SharedKey.token, value: value.data['data']['token']);
      SharedHelper.set(key: SharedKey.name, value: value.data['data']['name']);
      SharedHelper.set(
          key: SharedKey.email, value: value.data['data']['email']);
      SharedHelper.set(
          key: SharedKey.phone, value: value.data['data']['phone']);
      SharedHelper.set(key: SharedKey.city, value: value.data['data']['city']);
      SharedHelper.set(
          key: SharedKey.address, value: value.data['data']['address']);
      emit(UpdateProfileSuccess());
    }).catchError((error) {
      emit(UpdateProfileError(error.toString()));
    });
  }

  void showProfile() async {
    emit(ShowProfileLoadingState());
    await DioHelper.getData(endpoint: EndPoints.profile, withToken: true)
        .then((value) {
      nameController.text = value.data['data']['name'];
      emailController.text = value.data['data']['email'];
      phoneController.text = value.data['data']['phone'];
      cityController.text = value.data['data']['city'];
      addressController.text = value.data['data']['address'];

      emit(ShowProfileSuccessState());
    }).catchError((error) {
      print(error.toString());
      if (error is DioException) {
        print(error.response?.data);
      }
      emit(ShowProfileErrorState());
      throw error;
    });
  }


}
