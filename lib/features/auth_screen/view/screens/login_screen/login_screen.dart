import 'package:book_store/core/components/widgets/elevated_button.dart';
import 'package:book_store/core/components/widgets/text_form_field_custom.dart';
import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/core/utils/navigation.dart';
import 'package:book_store/features/auth_screen/view_model/auth_cubit/cubit.dart';
import 'package:book_store/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../view_model/auth_cubit/state.dart';
import '../../widgets/login/logo_login.dart';
import '../../widgets/register/register_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(12.0.sp),
          child: ListView(
            children: [
              SizedBox(height: 40.h),
              const Logo(),
              SizedBox(height: 40.h),
              const RegisterButton(),
              Container(
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border:
                        Border.all(color: AppColors.primaryColor, width: 2.w)),
                child: BlocConsumer<AuthCubit, AuthState>(
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
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                            ),
                            hintTextStyle:
                                const TextStyle(color: AppColors.primaryColor),
                            labelTextStyle:
                                const TextStyle(color: AppColors.primaryColor),
                            prefixIcon: const Icon(Icons.email,
                                color: AppColors.primaryColor),
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
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                            ),
                            hintTextStyle:
                                const TextStyle(color: AppColors.primaryColor),
                            labelTextStyle:
                                const TextStyle(color: AppColors.primaryColor),
                            suffixIcon: IconButton(
                              onPressed: () {
                                cubit.changeObscure();
                              },
                              icon: Icon(cubit.obscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            prefixIcon: const Icon(Icons.lock,
                                color: AppColors.primaryColor),
                            hintText: 'Password',
                            labelText: 'Password',
                            validator: (value) {
                              if ((value ?? '').isEmpty) {
                                return 'please enter your password';
                              } else if (cubit.passwordController.text !=
                                  value) {
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
                      Navigation.pushAndReplace(context, const BottomNavBarScreen());
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
