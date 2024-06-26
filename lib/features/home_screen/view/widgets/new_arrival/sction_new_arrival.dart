import 'package:book_store/core/components/widgets/text_custom.dart';
import 'package:book_store/core/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'list_new_arrival.dart';

class SectionNewArrival extends StatelessWidget {
  const SectionNewArrival({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextCustom(
          text: '   NewArrival',
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.kBlack,
        ),
        SizedBox(
          height: 300.h,
          child: const ListOfNewArrival(),
        ),
      ],
    );
  }
}
