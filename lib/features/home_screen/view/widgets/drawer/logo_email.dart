import 'package:book_store/core/data/local/shared_helper.dart';
import 'package:book_store/core/data/local/shared_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/widgets/text_custom.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../profile_screen/view_model/cubits/profile_cubit/profile_cubit.dart';

class LogoAndEmail extends StatelessWidget {
  const LogoAndEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: double.infinity,
        height: 200.h,
        color: AppColors.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('assets/images/profile.jpg')),
            TextCustom(
              text: SharedHelper.get(key: SharedKey.userName),
              fontSize: 30,
              color: AppColors.kWhite,
            ),
            TextCustom(
              text: SharedHelper.get(key: SharedKey.email),
              fontSize: 20,
              color: AppColors.kWhite,
            ),
          ],
        ),
      );
  }
}
