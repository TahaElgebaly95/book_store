import 'package:book_store/core/data/local/shared_helper.dart';
import 'package:book_store/core/utils/navigation.dart';
import 'package:book_store/features/auth_screen/view/screens/login_screen/login_screen.dart';
import 'package:book_store/features/home_screen/view/widgets/drawer/change_pass_button.dart';
import 'package:book_store/features/home_screen/view/widgets/drawer/logo_email.dart';
import 'package:book_store/features/home_screen/view/widgets/drawer/logout_button.dart';
import 'package:book_store/features/home_screen/view/widgets/drawer/order_edit_buttons.dart';
import 'package:book_store/features/profile_screen/view/screen/profile_screen.dart';
import 'package:book_store/features/profile_screen/view_model/cubits/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/components/widgets/text_custom.dart';
import '../../../../../core/data/local/shared_keys.dart';
import '../../../../../core/utils/colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          LogoAndEmail(),
          OrderAndEditButtons(),
          ChangePasswordButton(),
          Divider(color: AppColors.kGrey, endIndent: 30, indent: 20),
          LogOutButton(),
        ],
      ),
    );
  }
}
