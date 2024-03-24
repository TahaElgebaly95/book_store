import 'package:book_store/core/utils/colors.dart';
import 'package:flutter/material.dart';

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
              const IfHaveAcc(),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primaryColor, width: 2),
                ),
                child: const SectionFormField(),
              ),
              const SizedBox(height: 140),
            ],
          ),
        ),
      ),
    );
  }
}
