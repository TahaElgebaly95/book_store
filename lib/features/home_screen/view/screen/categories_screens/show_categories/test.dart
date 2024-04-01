// import 'package:book_store/features/home_screen/view/sections/categories/categories_widget.dart';
// import 'package:book_store/features/home_screen/view_model/cubit/categories_cubit/categories_cubit.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../view_model/cubit/categories_cubit/categories_state.dart';
//
// class Test extends StatelessWidget {
//   const Test({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<CategoriesCubit, CategoriesState>(
//       builder: (context, state) {
//         var cubit = CategoriesCubit.get(context);
//         return ListView.separated(itemBuilder: (context, index) =>
//             SizedBox(
//                 height: 200.h,
//                 child: CategoriesWidget(categories: cubit.categoriesList[index])),
//             separatorBuilder: (context, index) => SizedBox(height: 10.h,),
//             itemCount: cubit.categoriesList.length);
//       }, listener: (context, state) {
//
//     },);
//   }
// }
