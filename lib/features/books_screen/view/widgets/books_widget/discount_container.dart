import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/components/widgets/text_custom.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../home_screen/model/products/all_products_model.dart';

class DiscAndImageContainer extends StatelessWidget {
  const DiscAndImageContainer({super.key, required this.allProductModel});

  final Products allProductModel;
  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: DecorationImage(
          image: NetworkImage(allProductModel.image ?? ''),
          fit: BoxFit.cover,
        ),
      ),
      child:
      Stack(
        children: [
          Positioned(
            left: 10.w,
            top: 10.h,
            child: Container(
              alignment: Alignment.center,
              height: 25.h,
              width: 45.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.kRed,
              ),
              child: TextCustom(
                  text: '${allProductModel.discount.toString()} %',
                  color: AppColors.kWhite,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center),
            ),
          )
        ],
      ),
    );

  }
}
