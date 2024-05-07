import 'package:book_store/core/components/widgets/text_custom.dart';
import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/features/home_screen/model/categories/categories_model.dart';
import 'package:book_store/features/home_screen/view_model/cubit/categories_cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../view_model/cubit/categories_cubit/categories_state.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key, required this.categories, this.onTap});

  // final int id;
  final Categories categories;
  final void Function()? onTap;

  @override
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child:
          CategoriesCubit.get(context).state is GetProductsByCategoriesLoading
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  alignment: Alignment.center,
                  width: 110.w,
                  height: 100.h,
                  // color: AppColors.primaryColor,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/book.jpg'),
                        fit: BoxFit.cover),
                  ),
                  child: TextCustom(
                    textAlign: TextAlign.center,
                    text: categories.name ?? '',
                    color: AppColors.kWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
    );
  }
}
