import 'package:book_store/features/auth_screen/view_model/auth_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/widgets/elevated_button.dart';
import '../../../../core/components/widgets/text_form_field_custom.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/navigation.dart';
import '../../view/screens/login_screen/login_screen.dart';
import '../auth_cubit/state.dart';

class SectionFormField extends StatelessWidget {
  const SectionFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: cubit.registerKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(
                controller: cubit.nameController,
                obscureText: false,
                obscuringCharacter: '*',
                hintTextStyle: const TextStyle(color: AppColors.primaryColor),
                labelTextStyle: const TextStyle(color: AppColors.primaryColor),
                keyboardType: TextInputType.name,
                prefixIcon:
                    const Icon(Icons.person, color: AppColors.primaryColor),
                hintText: 'Name',
                labelText: 'Name',
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                controller: cubit.emilaController,
                obscureText: false,
                obscuringCharacter: '*',
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
                hintTextStyle: const TextStyle(color: AppColors.primaryColor),
                labelTextStyle: const TextStyle(color: AppColors.primaryColor),
                prefixIcon:
                    const Icon(Icons.email, color: AppColors.primaryColor),
                hintText: 'Email',
                labelText: 'Email',
                validator: (value) {
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!)) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                controller: cubit.passwordController,
                obscureText: true,
                obscuringCharacter: '*',
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
                hintTextStyle: const TextStyle(color: AppColors.primaryColor),
                labelTextStyle: const TextStyle(color: AppColors.primaryColor),
                suffixIcon: IconButton(
                    onPressed: () {
                      cubit.changeConfirmObscure();
                    },
                    icon: Icon(
                        cubit.confirmObscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: cubit.confirmObscure
                            ? AppColors.primaryColor
                            : AppColors.kGrey)),
                prefixIcon:
                    const Icon(Icons.lock, color: AppColors.primaryColor),
                hintText: 'Password',
                labelText: 'Password',
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return 'Enter your password';
                  } else if (!RegExp(r'[A-Z]').hasMatch(value!)) {
                    return 'Password should has at least one uppercase letter';
                  } else if (!RegExp(r'[!@#\\$%^&*(),.?":{}|<>]')
                      .hasMatch(value)) {
                    return 'Password should has special character';
                  } else if (!RegExp(r'[1-9]').hasMatch(value)) {
                    return 'password should has one number at least';
                  } else if ((value.length ?? 0) < 8) {
                    return 'Password can\'t be less than 8 Characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                obscureText: true,
                obscuringCharacter: '*',
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
                hintTextStyle: const TextStyle(color: AppColors.primaryColor),
                labelTextStyle: const TextStyle(color: AppColors.primaryColor),
                prefixIcon:
                    const Icon(Icons.lock, color: AppColors.primaryColor),
                hintText: 'Confirm Password',
                labelText: 'Confirm Password',
                controller: cubit.conPasswordController,
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return 'Enter your password';
                  } else if (!RegExp(r'[A-Z]').hasMatch(value!)) {
                    return 'Password should has at least one uppercase letter';
                  } else if (!RegExp(r'[!@#\\$%^&*(),.?":{}|<>]')
                      .hasMatch(value)) {
                    return 'Password should has special character';
                  } else if (!RegExp(r'[1-9]').hasMatch(value)) {
                    return 'password should has one number at least';
                  } else if ((value.length ?? 0) < 8) {
                    return 'Password can\'t be less than 8 Characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              CustomElevatedButton(
                onPressed: () {
                  if (cubit.registerKey.currentState!.validate()) {
                    cubit.register();
                  }
                },
                nameOfButton: 'Register',
                backgroundColor: AppColors.primaryColor,
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          Navigation.pushAndReplace(context, const LoginScreen());
          AuthCubit.get(context).emilaController.clear();
          AuthCubit.get(context).passwordController.clear();
        }
      },
    );
  }
}
