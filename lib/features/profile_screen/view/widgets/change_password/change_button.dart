import 'package:book_store/features/profile_screen/view_model/cubits/profile_cubit/profile_cubit.dart';
import 'package:book_store/features/profile_screen/view_model/cubits/update_password_cubit/update_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/widgets/elevated_button.dart';
import '../../../../../core/utils/colors.dart';
import '../../../view_model/cubits/profile_cubit/profile_state.dart';

class UpdatePasswordButton extends StatelessWidget {
  const UpdatePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      return  CustomElevatedButton(
        nameOfButton: 'Change Password',
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          UpdatePasswordCubit.get(context).changePassword();
        },
      );
    });
  }
}
