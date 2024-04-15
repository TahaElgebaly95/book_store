import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/widgets/text_custom.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../home_screen/model/products/all_products_model.dart';

class DetailsTexts extends StatelessWidget {
  const DetailsTexts({super.key, required this.allProductModel});

  final Products allProductModel;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TextCustom(
          text: allProductModel.name ?? '',
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
          //   softWrap: true,
          fontSize: 19.sp,
          overflow: TextOverflow.ellipsis,
        ),
        TextCustom(
          text: allProductModel.category ?? '',
          fontSize: 16.sp,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.bold,
          color: AppColors.kGrey,
        ),
        TextCustom(
          text: (allProductModel.price ?? '').toString(),
          fontSize: 16.sp,
          decoration: TextDecoration.lineThrough,
          textAlign: TextAlign.center,
        ),
        TextCustom(
          text: (allProductModel.priceAfterDiscount ?? '').toString(),
          color: AppColors.kCyan,
          textAlign: TextAlign.center,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
