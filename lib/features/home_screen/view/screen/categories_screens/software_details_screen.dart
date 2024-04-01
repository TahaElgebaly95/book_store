import 'package:book_store/features/home_screen/view/screen/categories_screens/show_categories/show_categories_widget.dart';
import 'package:book_store/features/home_screen/view_model/cubit/categories_cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SoftWareDetailsScreen extends StatelessWidget {
  const SoftWareDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemBuilder: (context, index) => SizedBox(
          height: 200.h,
          child: ShowCategoriesWidget(
            productsDetails: CategoriesCubit.get(context).productsList[index],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 10.h,
        ),
        itemCount: CategoriesCubit.get(context).productsList.length,
      ),
    );
  }
}
