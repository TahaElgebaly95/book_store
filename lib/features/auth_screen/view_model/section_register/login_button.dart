import 'package:book_store/core/utils/navigation.dart';
import 'package:book_store/features/auth_screen/view/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/widgets/text_custom.dart';
import '../../../../core/utils/colors.dart';

class IfHaveAcc extends StatelessWidget {
  const IfHaveAcc({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextCustom(
          text: 'Already have an account?',
          fontSize: 18.sp,
          color: AppColors.kGrey,
        ),
        TextButton(
          onPressed: () {
            Navigation.push(context, const LoginScreen());
          },
          child: Text(
            'Login',
            style: TextStyle(color: AppColors.primaryColor, fontSize: 18.sp),
          ),
        ),
      ],
    );
  }
}
