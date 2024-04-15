import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/features/profile_screen/view/widgets/city.dart';
import 'package:book_store/features/profile_screen/view/widgets/container_of_fields.dart';
import 'package:book_store/features/profile_screen/view/widgets/edit_profile_button.dart';
import 'package:book_store/features/profile_screen/view/widgets/email.dart';
import 'package:book_store/features/profile_screen/view/widgets/name.dart';
import 'package:book_store/features/profile_screen/view/widgets/phone.dart';
import 'package:book_store/features/profile_screen/view/widgets/sectionOfProfileLogo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../view_model/cubits/profile_cubit/profile_cubit.dart';
import '../../view_model/cubits/profile_cubit/profile_state.dart';
import '../widgets/address.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  ListView(
          children: [
            const SectionOfProfileLogo(),
            ContainerOfFields(
              child: Column(
                children: [
                  Name(),
                  SizedBox(height: 8.h),
                  Email(),
                  SizedBox(height: 8.h),
                  const Phone(),
                  SizedBox(height: 8.h),
                  const City(),
                  SizedBox(height: 8.h),
                  const Address(),
                ],
              ),
            ),
            const EditProfileButton()
          ],
        ),
      ),
    );
  }
}
