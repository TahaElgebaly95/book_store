import 'package:flutter/material.dart';

import '../../../../core/components/widgets/text_custom.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/navigation.dart';
import '../screens/register_screen/register_screen.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const TextCustom(
          text: 'Don\'t have an account?',
          fontSize: 18,
          color: AppColors.kGrey,
        ),
        TextButton(
          onPressed: () {
            Navigation.push(context, const RegisterScreen());
          },
          child: const Text(
            'Register',
            style: TextStyle(color: AppColors.primaryColor, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
