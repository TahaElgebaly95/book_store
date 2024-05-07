import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({super.key,  this.child, required this.url});

  final Widget? child;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      padding: EdgeInsets.all(10.sp),
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(url),fit: BoxFit.fill),
        border: Border.all(color: AppColors.kGrey, width: 2),
        borderRadius: BorderRadius.circular(15.r),
      ),
    child: child,
    );
  }
}
