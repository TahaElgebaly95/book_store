import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/components/widgets/text_custom.dart';
import '../../../../../core/utils/colors.dart';

class NameAndDeleteIcon extends StatelessWidget {
  const NameAndDeleteIcon({super.key, required this.bookName, this.delButton});

 final String bookName;
 final  void Function()? delButton;
  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 140.w,
          child: TextCustom(
            text: bookName,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.kGrey,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: delButton,
          icon: Icon(
            Icons.delete,
            color: AppColors.kRed,
            size: 30.sp,
          ),
        ),
      ],
    );
  }
}
