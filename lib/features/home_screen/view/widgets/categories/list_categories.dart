import 'package:book_store/core/utils/navigation.dart';
import 'package:book_store/features/home_screen/view/widgets/categories/details_of_categories/list_get_product_by_cat_.dart';
import 'package:book_store/features/home_screen/view_model/cubit/categories_cubit/categories_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../view_model/cubit/categories_cubit/categories_state.dart';
import 'categories_widget.dart';

class ListOfCategories extends StatelessWidget {
  const ListOfCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        var cubit = CategoriesCubit.get(context);
        return state is CategoriesLoading
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                height: 100.h,
                width: 110.w,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        state is GetProductsByCategoriesLoading
                            ? const Center(child: CircularProgressIndicator())
                            : CategoriesWidget(
                                categories: cubit.categoriesList[index],
                                onTap: () async {
                                  await cubit.getProductsByCategories(
                                      cubit.categoriesList[index].id!.toInt());
                                  // print(cubit.categoriesList[index].id);
                                  Navigation.push(context,
                                      const ListGetProductByCategoriesScreen());
                                },
                              ),
                    separatorBuilder: (context, index) => SizedBox(width: 0.w),
                    itemCount: cubit.categoriesList.length),
              );
      },
      listener: (context, state) {},
    );
  }
}
