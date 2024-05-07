import 'package:book_store/core/utils/logout_methods.dart';
import 'package:flutter/material.dart';
import '../../../../../core/components/widgets/text_custom.dart';
import '../../../../../core/utils/colors.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Logout.logoutMethod(context);
      },
      leading: const Icon(
        Icons.login,
        color: AppColors.kRed,
        size: 35,
      ),
      title: const TextCustom(
        text: 'Log Out',
        color: AppColors.kGrey,
        fontSize: 20,
      ),);
  }
}
