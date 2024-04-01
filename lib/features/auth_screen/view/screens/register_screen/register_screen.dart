import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/features/auth_screen/view/components/logo_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view_model/section_register/login_button.dart';
import '../../../view_model/section_register/section_form_field.dart';

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
              SizedBox(height: 40.h),
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Logo()],
              ),
              SizedBox(height: 40.h),
              const IfHaveAcc(),
              Container(
                padding: EdgeInsets.all(15.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primaryColor, width: 2.w),
                ),
                child: const SectionFormField(),
              ),
              SizedBox(height: 140.h),
            ],
          ),
        ),
      ),
    );
  }
}
