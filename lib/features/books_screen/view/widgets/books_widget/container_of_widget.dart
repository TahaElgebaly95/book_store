import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';

class ContainerOfWidget extends StatelessWidget {
  const ContainerOfWidget({super.key, required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,vertical: 5.h
      ),
      padding: EdgeInsets.all(10.sp),
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kGrey, width: 2),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: child,
    );
  }
}
