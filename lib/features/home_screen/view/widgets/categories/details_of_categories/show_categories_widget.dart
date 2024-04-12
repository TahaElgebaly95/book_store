import 'package:book_store/features/home_screen/model/categories/ProductsDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/components/widgets/text_custom.dart';
import '../../../../../../core/utils/colors.dart';

class ShowCategoriesWidget extends StatelessWidget {
  const ShowCategoriesWidget({super.key, required this.productsDetails});

  final ProductsDetails productsDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.sp),
      padding: EdgeInsets.all(12.sp),
      height: 160.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kGrey, width: 2),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: DecorationImage(
                  image: NetworkImage('${productsDetails.image}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                TextCustom(
                  text: '${productsDetails.name}',
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  //   softWrap: true,
                  fontSize: 19.sp, overflow: TextOverflow.ellipsis,
                ),
                TextCustom(
                  text: '${productsDetails.stock}',
                  fontSize: 14.sp,
                  textAlign: TextAlign.center,
                ),
                TextCustom(
                  text: '${productsDetails.price}',
                  color: AppColors.kCyan,
                  textAlign: TextAlign.center,
                  fontSize: 17,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
