import 'package:book_store/features/profile_screen/view_model/cubits/update_password_cubit/update_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/components/widgets/text_form_field_custom.dart';
import '../../../../../core/utils/colors.dart';
import '../../../view_model/cubits/profile_cubit/profile_cubit.dart';
import '../../../view_model/cubits/profile_cubit/profile_state.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = UpdatePasswordCubit.get(context);
    return BlocBuilder<UpdatePasswordCubit, UpdatePasswordState>(
      builder: (context, state) {
        return CustomTextFormField(
          controller: UpdatePasswordCubit.get(context).newPasswordController,
          keyboardType: TextInputType.visiblePassword,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          prefixIcon: const Icon(Icons.lock,color: AppColors.primaryColor,),
          validator: (value) {
            cubit.newPasswordController.text;
            if ((value ?? '').isEmpty) {
              return 'Enter your password';
            } else if (!RegExp(r'[A-Z]').hasMatch(value!)) {
              return 'Password should has at least one uppercase letter';
            } else if (!RegExp(r'[!@#\\$%^&*(),.?":{}|<>]').hasMatch(value)) {
              return 'Password should has special character';
            } else if (!RegExp(r'[1-9]').hasMatch(value)) {
              return 'password should has one number at least';
            } else if ((value.length ?? 0) < 8) {
              return 'Password can\'t be less than 8 Characters';
            }
            return null;
          },
          hintText: 'New Password',
          obscureText: cubit.isNewPasswordVisible ? true : false,
          suffixIcon: IconButton(
            icon: cubit.isNewPasswordVisible
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
            color: cubit.isNewPasswordVisible ? AppColors.primaryColor : AppColors.kGrey,
            onPressed: () {
              cubit.changeNewPasswordVisibility();
            },
          ),
        );
      },
    );
  }
}
