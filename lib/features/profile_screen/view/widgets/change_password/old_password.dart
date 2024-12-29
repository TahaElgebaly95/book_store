import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/components/widgets/text_form_field_custom.dart';
import '../../../../../core/utils/colors.dart';
import '../../../view_model/cubits/update_password_cubit/update_password_cubit.dart';

class CurrentPassword extends StatelessWidget {
  const CurrentPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = UpdatePasswordCubit.get(context);
    return BlocBuilder<UpdatePasswordCubit, UpdatePasswordState>(
      builder: (context, state) {
        return CustomTextFormField(
          controller:
              UpdatePasswordCubit.get(context).currentPasswordController,
          keyboardType: TextInputType.visiblePassword,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          prefixIcon: const Icon(
            Icons.lock,
            color: AppColors.primaryColor,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your old password';
            }
            return null;
          },
          hintText: 'Current Password',
          obscureText: cubit.isCurrentPasswordVisible ? true : false,
          suffixIcon: IconButton(
            icon: cubit.isCurrentPasswordVisible
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
            color: cubit.isCurrentPasswordVisible ? AppColors.primaryColor : AppColors.kGrey,
            onPressed: () {
              cubit.changeCurrentPasswordVisibility();
            },
          ),
        );
      },
    );
  }
}
