import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {required this.nameOfButton,
      this.onPressed,
      super.key,
      this.backgroundColor});

  final String nameOfButton;
  final Color? backgroundColor;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 350.w,
      child: ElevatedButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        child: Text(
          nameOfButton,
          style: TextStyle(color: Colors.white, fontSize: 22.sp),
        ),
      ),
    );
  }
}
