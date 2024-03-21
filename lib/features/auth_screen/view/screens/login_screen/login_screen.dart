import 'package:book_store/core/components/widgets/elevated_button.dart';
import 'package:book_store/core/components/widgets/text_form_field_custom.dart';
import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/core/utils/navigation.dart';
import 'package:book_store/features/auth_screen/view/components/logo_login.dart';
import 'package:book_store/features/auth_screen/view/components/register_button.dart';
import 'package:book_store/features/auth_screen/view_model/auth_cubit/cubit.dart';
import 'package:book_store/features/home_screen/view/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../view_model/auth_cubit/state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              const SizedBox(height: 40),
              const Logo(),
              const SizedBox(height: 40),
              const RegisterButton(),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(color: AppColors.primaryColor, width: 2)),
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
                          const SizedBox(height: 10),
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
                            prefixIcon:
                                const Icon(Icons.lock, color: AppColors.primaryColor),
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
                          const SizedBox(height: 10),
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
