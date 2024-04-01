import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/widgets/elevated_button.dart';
import '../../../../core/components/widgets/text_form_field_custom.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/navigation.dart';
import '../../../../core/utils/show_toast.dart';
import '../../../auth_screen/view_model/auth_cubit/cubit.dart';
import '../../../auth_screen/view_model/auth_cubit/state.dart';
import '../../../home_screen/view/screen/home_screen.dart';

class SectionLogin extends StatelessWidget {
  const SectionLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: cubit.loginKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(
                obscuringCharacter: '*',
                obscureText: false,
                controller: cubit.emilaController,
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
                obscureText: cubit.obscure,
                obscuringCharacter: '*',
                onFieldSubmitted: (value) {
                  print(value);
                },
                onChanged: (value) {
                  print(value);
                },
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
                hintTextStyle: const TextStyle(color: AppColors.primaryColor),
                labelTextStyle: const TextStyle(color: AppColors.primaryColor),
                suffixIcon: IconButton(
                  onPressed: () {
                    cubit.changeObscure();
                  },
                  icon: Icon(
                    cubit.obscure ? Icons.visibility_off : Icons.visibility,
                    color: cubit.obscure ? Colors.grey : AppColors.primaryColor,
                  ),
                ),
                prefixIcon:
                    const Icon(Icons.lock, color: AppColors.primaryColor),
                hintText: 'Password',
                labelText: 'Password',
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return 'please enter your password';
                  } else if (cubit.passwordController.text != value) {
                    return 'wrong password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              CustomElevatedButton(
                onPressed: () {
                  if (cubit.loginKey.currentState!.validate()) {
                    cubit.login();
                  }
                },
                nameOfButton: 'Login',
                backgroundColor: AppColors.primaryColor,
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigation.pushAndReplace(context, const HomeScreen());
        }
        if (state is LoginErrorState) {
          customShowToast(state.error.toString());
        }
      },
    );
  }
}
