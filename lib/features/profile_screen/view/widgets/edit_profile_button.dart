import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/widgets/elevated_button.dart';
import '../../../../core/utils/colors.dart';
import '../../view_model/cubits/profile_cubit/profile_cubit.dart';
import '../../view_model/cubits/profile_cubit/profile_state.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: CustomElevatedButton(
            nameOfButton: state is ChangeEditingProfile
                ? 'Update Profile'
                : 'Edit Profile',
            onPressed: () {
              cubit.changeEditingProfile();
              if (state is ChangeEditingProfile) {
                cubit.updateProfile();
              }
            },
            backgroundColor: AppColors.primaryColor,
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
