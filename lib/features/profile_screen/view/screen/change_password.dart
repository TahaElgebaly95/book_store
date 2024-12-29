import 'package:book_store/core/components/widgets/elevated_button.dart';
import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/core/utils/show_toast.dart';
import 'package:book_store/features/auth_screen/view_model/auth_cubit/cubit.dart';
import 'package:book_store/features/profile_screen/view/widgets/change_password/confirm_new_password.dart';
import 'package:book_store/features/profile_screen/view/widgets/change_password/new_password.dart';
import 'package:book_store/features/profile_screen/view/widgets/change_password/old_password.dart';
import 'package:book_store/features/profile_screen/view_model/cubits/profile_cubit/profile_cubit.dart';
import 'package:book_store/features/profile_screen/view_model/cubits/profile_cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/widgets/text_custom.dart';
import '../../view_model/cubits/update_password_cubit/update_password_cubit.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdatePasswordCubit, UpdatePasswordState>(
  builder: (context, state) {
    return Scaffold(
        appBar: AppBar(
          title: TextCustom(
              text: 'Change Password',
              fontWeight: FontWeight.bold,
              fontSize: 20.sp),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: UpdatePasswordCubit.get(context).changePasswordFormKey,
            child: Column(
              children: [
                const CurrentPassword(),
                SizedBox(height: 20.h),
                const NewPassword(),
                SizedBox(height: 20.h),
                const ConfirmNewPassword(),
                SizedBox(height: 20.h),
                CustomElevatedButton(
                  nameOfButton: 'Change Password',
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () {
                    if (UpdatePasswordCubit.get(context)
                            .changePasswordFormKey
                            .currentState!
                            .validate() &&
                        UpdatePasswordCubit.get(context).newPasswordController.text ==
                            UpdatePasswordCubit.get(context)
                                .confirmPasswordController
                                .text &&
                        UpdatePasswordCubit.get(context)
                            .currentPasswordController
                            .text
                            .isNotEmpty &&
                        UpdatePasswordCubit.get(context)
                                .currentPasswordController
                                .text ==
                            AuthCubit.get(context).passwordController.text) {
                      {
                        UpdatePasswordCubit.get(context).changePassword();
                        customShowToast('Password changed successfully!');
                        UpdatePasswordCubit.get(context).resetPassword();
                        Navigator.pop(context);
                      }
                    }
                  },
                ),
                // const UpdatePasswordButton(),
              ],
            ),
            
          ),
        ));
  },
);
  }
}
