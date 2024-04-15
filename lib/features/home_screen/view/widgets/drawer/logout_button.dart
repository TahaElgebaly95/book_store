import 'package:book_store/features/auth_screen/view_model/auth_cubit/cubit.dart';
import 'package:flutter/material.dart';
import '../../../../../core/components/widgets/text_custom.dart';
import '../../../../../core/data/local/shared_helper.dart';
import '../../../../../core/data/local/shared_keys.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/navigation.dart';
import '../../../../auth_screen/view/screens/login_screen/login_screen.dart';
import '../../../../profile_screen/view_model/cubits/profile_cubit/profile_cubit.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        ProfileCubit.get(context).close();
        AuthCubit.get(context).reset();
        ProfileCubit.get(context).resetProfile();
        AuthCubit.get(context).logOut();
        Navigation.pushAndReplace(context, const LoginScreen());
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
