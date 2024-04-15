import 'package:flutter/material.dart';
import '../../../../../core/components/widgets/text_custom.dart';
import '../../../../../core/utils/colors.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: AppColors.kGrey, endIndent: 30, indent: 20),
        ListTile(
          onTap: () {
            // Navigation.push(context, screen)
          },
          leading: const Icon(
            Icons.change_circle_outlined,
            color: AppColors.kGrey,
            size: 35,
          ),
          title: const TextCustom(
            text: 'Change Password',
            color: AppColors.kGrey,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
