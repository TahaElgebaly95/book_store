import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/core/utils/logout_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/components/widgets/text_custom.dart';
import '../../../view_model/cubits/profile_cubit/profile_cubit.dart';
import '../../../view_model/cubits/profile_cubit/profile_state.dart';
import 'clip_path.dart';

class SectionOfProfileLogo extends StatelessWidget {
  const SectionOfProfileLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        ClipPath(
          clipper: CustomClipPath(),
          child: Container(
            width: double.infinity,
            height: 150.h,
            color: AppColors.primaryColor,
          ),
        ),
        Positioned(
          top: 0.h,
          child: TextCustom(
              text: 'Profile',
              fontSize: 35.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.kWhite),
        ),
        Positioned(
          top: 0.h,
          right: 25.w,
          child: IconButton(
            onPressed: () {
              Logout.logoutMethod(context);
            },
            icon: Icon(
              Icons.login_outlined,
              color: AppColors.kWhite,
              size: 35.sp,
            ),
          ),
        ),
        Positioned(
          top: 45.h,
          child: CircleAvatar(
            backgroundColor: AppColors.kRed,
            maxRadius: 79.r,
            child: CircleAvatar(
              maxRadius: 75.r,
              backgroundImage: const AssetImage('assets/images/profile.jpg'),
            ),
          ),
        ),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Positioned(
              top: 110.h,
              right: 80.w,
              child: Visibility(
                visible: state is ChangeEditingProfile,
                child: IconButton(
                  onPressed: () {},
                  icon:
                      const Icon(Icons.edit, size: 40, color: AppColors.kAmber),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
