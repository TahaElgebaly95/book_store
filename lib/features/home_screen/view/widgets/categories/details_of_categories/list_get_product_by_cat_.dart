import 'package:book_store/core/utils/navigation.dart';
import 'package:book_store/features/home_screen/view/widgets/best_seller/book_details/show_book_details.dart';
import 'package:book_store/features/home_screen/view/widgets/categories/details_of_categories/show_categories_widget.dart';
import 'package:book_store/features/home_screen/view_model/cubit/categories_cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListGetProductByCategoriesScreen extends StatelessWidget {
  const ListGetProductByCategoriesScreen({super.key});

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
