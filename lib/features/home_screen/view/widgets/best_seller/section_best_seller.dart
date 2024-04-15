import 'package:book_store/core/components/widgets/text_custom.dart';
import 'package:book_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../view_model/cubit/best_seller_cubit/best_seller_cubit.dart';
import 'list_best_seller.dart';

class SectionBestSeller extends StatelessWidget {
  const SectionBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextCustom(
          text: '   BestSeller',
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.kBlack,
        ),
        if (BestSellerCubit.get(context).bestSellerList.isEmpty)
          const Center(
            child: CircularProgressIndicator(),
          )
        else
          SizedBox(
            height: 300.h,
            child: const ListOfBestSeller(),
          ),
      ],
    );
  }
}
