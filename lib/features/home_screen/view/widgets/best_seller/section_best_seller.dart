import 'package:book_store/core/components/widgets/text_custom.dart';
import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/features/home_screen/view_model/cubit/best_seller_cubit/best_seller_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../view_model/cubit/best_seller_cubit/best_seller_cubit.dart';
import 'list_best_seller.dart';

class SectionBestSeller extends StatelessWidget {
  const SectionBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
      builder: (context, state) {
        var cubit = BestSellerCubit.get(context);
        return
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextCustom(
              text: '   BestSeller',
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.kBlack,
            ),
            SizedBox(
              height: 300.h,
              child: state is BestSellerLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const ListOfBestSeller(),
            ),
          ],
        );
      },
    );
  }
}
