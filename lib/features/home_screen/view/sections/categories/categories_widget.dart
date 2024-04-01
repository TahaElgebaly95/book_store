import 'package:book_store/core/components/widgets/text_custom.dart';
import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/core/utils/navigation.dart';
import 'package:book_store/features/home_screen/model/categories/categories_model.dart';
import 'package:book_store/features/home_screen/view/screen/categories_screens/ai_details_screen.dart';
import 'package:book_store/features/home_screen/view_model/cubit/categories_cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../screen/categories_screens/devops_details_Screen.dart';
import '../../screen/categories_screens/software_details_screen.dart';

class CategoriesWidget extends StatefulWidget {
  CategoriesWidget({super.key, required this.categories});

  Categories categories;

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  void initState() {
    CategoriesCubit.get(context).getProductsByCategories(widget.categories.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        alignment: Alignment.center,
        width: 110.w,
        height: 100.h,
        // color: AppColors.primaryColor,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          image: const DecorationImage(
              image: AssetImage('assets/images/book.jpg'), fit: BoxFit.cover),
        ),
        child: TextCustom(
          textAlign: TextAlign.center,
          text: widget.categories.name ?? '',
          color: AppColors.kWhite,
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
        ),
      ),
      onTap: () {
        print(widget.categories.id);
        switch (widget.categories.id) {
          case 2:
            Navigation.push(context, const SoftWareDetailsScreen());
            break;
          case 3:
            Navigation.push(context, const AiAndDataScienceScreen());
            break;
          case 4:
            Navigation.push(context, const DevOpsDetailsScreen());
            break;
        }
      },
    );
  }
}
