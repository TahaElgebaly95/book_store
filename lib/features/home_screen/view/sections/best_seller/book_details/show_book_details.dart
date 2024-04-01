import 'package:book_store/core/components/widgets/elevated_button.dart';
import 'package:book_store/core/components/widgets/text_custom.dart';
import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/features/home_screen/model/products/all_products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowBookDetails extends StatelessWidget {
  ShowBookDetails({super.key, required this.products});
  Products products;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.kWhite),
      child: ListView(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: 390.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  ),
                  image: DecorationImage(
                    image: NetworkImage('${products.image}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 35.h,
                right: 20.w,
                child: CircleAvatar(
                  radius: 30.r,
                  backgroundColor: AppColors.kTransparent.withOpacity(.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: AppColors.kRed,
                      size: 35.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                TextCustom(
                  text: products.name ?? '',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kBlack,
                ),
                Row(
                  children: [
                    TextCustom(
                      text: products.category ?? '',
                      fontSize: 15.sp,
                      color: AppColors.kGrey,
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        TextCustom(
                          decoration: TextDecoration.lineThrough,
                          text: products.price.toString(),
                          fontSize: 15.sp,
                          color: AppColors.kGrey,
                        ),
                        TextCustom(
                          softWrap: true,
                          text: products.priceAfterDiscount.toString(),
                          fontSize: 15.sp,
                          color: AppColors.kCyan,
                        ),
                      ],
                    ),
                  ],
                ),
                TextCustom(
                  text: 'Description:',
                  color: AppColors.kBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
                SizedBox(height: 10.h),
                TextCustom(
                    softWrap: true,
                    text: products.description ?? '',
                    fontSize: 14.sp,
                    color: AppColors.kGrey),
                SizedBox(height: 10.h),
                CustomElevatedButton(
                  nameOfButton: 'Add to Cart',
                  onPressed: () {},
                  backgroundColor: AppColors.primaryColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
