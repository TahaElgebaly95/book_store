import 'package:book_store/core/data/local/shared_helper.dart';
import 'package:book_store/core/data/local/shared_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/widgets/text_custom.dart';
import '../../../../core/utils/colors.dart';

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
              text: 'Hi, ${SharedHelper.get(key: SharedKey.userName)}',
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
