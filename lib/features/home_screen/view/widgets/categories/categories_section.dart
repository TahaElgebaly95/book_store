import 'package:book_store/core/components/widgets/text_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'list_categories.dart';

class SectionCategories extends StatelessWidget {
  const SectionCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextCustom(
            text: '  Categories', fontSize: 20.sp, fontWeight: FontWeight.bold),
        SizedBox(height: 5.h),
        const SizedBox(width: double.infinity, child: ListOfCategories())
      ],
    );
  }
}
