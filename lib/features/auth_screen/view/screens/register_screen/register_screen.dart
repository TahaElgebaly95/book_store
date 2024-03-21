import 'package:book_store/core/components/widgets/elevated_button.dart';
import 'package:book_store/core/components/widgets/text_form_field_custom.dart';
import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/features/auth_screen/view/screens/login_screen/login_screen.dart';
import 'package:book_store/features/auth_screen/view_model/auth_cubit/cubit.dart';
import 'package:book_store/features/auth_screen/view_model/auth_cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/widgets/text_custom.dart';
import '../../../../../core/utils/navigation.dart';
import '../../../../home_screen/view/screen/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              const SizedBox(height: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/images/ktaby.png'),
                  const SizedBox(height: 40),
                  const Text(
                    'Join Us!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff32AFB5),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  const TextCustom(
                    text: 'Already have an account?',
                    fontSize: 18,
                    color: AppColors.kGrey,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 18),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primaryColor, width: 2),
                ),
                child: BlocConsumer<AuthCubit, AuthState>(
                  builder: (context, state) {
                    var cubit = AuthCubit.get(context);
                    return Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: cubit.registerKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CustomTextFormField(
                            obscureText: false,
                            obscuringCharacter: '*',
                            hintTextStyle:
                                TextStyle(color: AppColors.primaryColor),
                            labelTextStyle:
                                TextStyle(color: AppColors.primaryColor),
                            keyboardType: TextInputType.name,
                            prefixIcon: Icon(Icons.person,
                                color: AppColors.primaryColor),
                            hintText: 'Name',
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                            ),
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            obscureText: false,
                            obscuringCharacter: '*',
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                            ),
                            hintTextStyle:
                                TextStyle(color: AppColors.primaryColor),
                            labelTextStyle:
                                TextStyle(color: AppColors.primaryColor),
                            prefixIcon: Icon(Icons.email,
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
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            obscureText: true,
                            obscuringCharacter: '*',
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                            ),
                            hintTextStyle:
                                TextStyle(color: AppColors.primaryColor),
                            labelTextStyle:
                                TextStyle(color: AppColors.primaryColor),
                            suffixIcon: Icon(Icons.visibility_off_rounded,
                                color: AppColors.primaryColor),
                            prefixIcon:
                                Icon(Icons.lock, color: AppColors.primaryColor),
                            hintText: 'Password',
                            labelText: 'Password',
                          ),
                          const SizedBox(height: 10),
                          const CustomTextFormField(
                            obscureText: true,
                            obscuringCharacter: '*',
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                            ),
                            hintTextStyle:
                                TextStyle(color: AppColors.primaryColor),
                            labelTextStyle:
                                TextStyle(color: AppColors.primaryColor),
                            prefixIcon:
                                Icon(Icons.lock, color: AppColors.primaryColor),
                            hintText: 'Confirm Password',
                            labelText: 'Confirm Password',
                          ),
                          const SizedBox(height: 10),
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
                    }
                  },
                ),
              ),
              const SizedBox(height: 140),
            ],
          ),
        ),
      ),
    );
  }
}
