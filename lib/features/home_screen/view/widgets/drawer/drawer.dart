import 'package:book_store/features/home_screen/view/widgets/drawer/change_pass_button.dart';
import 'package:book_store/features/home_screen/view/widgets/drawer/logo_email.dart';
import 'package:book_store/features/home_screen/view/widgets/drawer/logout_button.dart';
import 'package:book_store/features/home_screen/view/widgets/drawer/order_edit_buttons.dart';
import 'package:flutter/material.dart';
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
