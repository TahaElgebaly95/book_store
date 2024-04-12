import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/widgets/text_custom.dart';
import '../../../../core/utils/colors.dart';
import '../../../profile_screen/view_model/cubits/profile_cubit/profile_cubit.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextCustom(
              text: 'Hi, ${ProfileCubit.get(context).nameController.text}',
              color: AppColors.kBlack,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
            TextCustom(
              text: 'What are you doing today?',
              color: AppColors.kGrey,
              fontSize: 16.sp,
            ),
          ],
        ),
        SizedBox(
          width: 40.w,
        ),
        CircleAvatar(
          radius: 25.r,
          backgroundImage: const AssetImage(
            'assets/images/profile.jpg',
          ),
        ),
      ],
    );
  }
}