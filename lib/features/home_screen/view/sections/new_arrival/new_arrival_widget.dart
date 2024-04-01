import 'package:book_store/core/components/widgets/text_custom.dart';
import 'package:book_store/features/home_screen/model/products/all_products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/colors.dart';

class NewArrivalWidget extends StatelessWidget {
  const NewArrivalWidget({required this.products, super.key});
  final Products products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: SizedBox(
        height: 190.h,
        width: 140.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 160.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage('${products.image}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 3.h,
                  left: 5.w,
                  child: TextCustom(
                    text: '${products.discount.toString()}% OFF',
                    color: AppColors.kRed,
                    fontSize: 14.sp,
                    backgroundColor: AppColors.kBlack,
                  ),
                )
              ],
            ),
            TextCustom(
              text: products.name ?? '',
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            TextCustom(text: products.category ?? ''),
            TextCustom(
              text: 'EGP ${products.priceAfterDiscount}',
              color: AppColors.kGrey,
              decoration: TextDecoration.lineThrough,
              fontSize: 14.sp,
            ),
            TextCustom(
              text: 'EGP ${products.price}',
              fontSize: 14.sp,
              color: AppColors.kCyan,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
