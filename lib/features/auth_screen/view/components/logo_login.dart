import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset('assets/images/ktaby.png'),
        SizedBox(height: 40.h),
        Text(
          'Join Us!',
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xff32AFB5),
          ),
        ),
      ],
    );
  }
}
