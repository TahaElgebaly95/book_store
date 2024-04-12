import 'package:book_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/widgets/text_custom.dart';
import '../../view_model/cubits/profile_cubit/profile_cubit.dart';
import '../../view_model/cubits/profile_cubit/profile_state.dart';

class SectionOfProfileLogo extends StatelessWidget {
  const SectionOfProfileLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image.asset('assets/images/wave.png'),
        Positioned(
          top: 20.h,
          child: TextCustom(
              text: 'Profile',
              fontSize: 35.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.kWhite),
        ),
        Positioned(
          top: 22.h,
          right: 25.w,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.login_outlined,
              color: AppColors.kWhite,
              size: 35.sp,
            ),
          ),
        ),
        Positioned(
          top: 75.h,
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
