import 'package:book_store/core/data/local/shared_helper.dart';
import 'package:book_store/core/utils/navigation.dart';
import 'package:book_store/features/auth_screen/view/screens/login_screen/login_screen.dart';
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
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200.h,
            color: AppColors.primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                TextCustom(
                  text: ProfileCubit.get(context).nameController.text,
                  fontSize: 30,
                  color: AppColors.kWhite,
                ),
                TextCustom(
                  text: ProfileCubit.get(context).emailController.text,
                  fontSize: 20,
                  color: AppColors.kWhite,
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              // Navigation.push(context, screen)
            },
            leading: Icon(
              Icons.history,
              color: AppColors.kGrey,
              size: 35,
            ),
            title: TextCustom(
              text: 'Order History',
              color: AppColors.kGrey,
              fontSize: 20,
            ),
          ),
          Divider(color: AppColors.kGrey, endIndent: 30, indent: 20),
          ListTile(
            onTap: () {
              Navigation.push(context, const ProfileScreen());
            },
            leading: Icon(
              Icons.edit,
              color: AppColors.kGrey,
              size: 35,
            ),
            title: TextCustom(
              text: 'Edit Prodile',
              color: AppColors.kGrey,
              fontSize: 20,
            ),
          ),
          Divider(color: AppColors.kGrey, endIndent: 30, indent: 20),
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
          const Divider(color: AppColors.kGrey, endIndent: 30, indent: 20),
          ListTile(
            onTap: () {
              ProfileCubit.get(context).close();
              SharedHelper.remove(key: SharedKey.token);

              Navigation.pushAndReplace(context, const LoginScreen());
            },
            leading: Icon(
              Icons.login,
              color: AppColors.kRed,
              size: 35,
            ),
            title: TextCustom(
              text: 'Log Out',
              color: AppColors.kGrey,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
