import 'package:book_store/core/utils/navigation.dart';
import 'package:book_store/features/books_screen/view/widgets/books_widget/books_widget.dart';
import 'package:book_store/features/books_screen/view_model/cubit/books_cubit.dart';
import 'package:book_store/features/cart_screen/view_model/cubits/cart_cubit/cubit.dart';
import 'package:book_store/features/favourite_screen/view_model/cubits/fav_cubit/cubit.dart';
import 'package:book_store/features/home_screen/view/widgets/best_seller/book_details/show_book_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../view_model/cubit/books_states.dart';

class ListOfBooks extends StatelessWidget {
  const ListOfBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksStates>(
      builder: (context, state) {
        var cubit = BooksCubit.get(context);
        return BooksCubit.get(context).state is LoadingBooksStates
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => SizedBox(
                      height: 170.h,
                      child: BooksWidget(
                          favButton: () {
                            FavouriteCubit.get(context)
                                .addToFavourite(id: cubit.booksList[index].id!);
                          },
                          cartButton: () {
                            CartCubit.get(context)
                                .addToCart(id: cubit.booksList[index].id!);
                          },
                          onTap: () {
                            Navigation.push(
                                context,
                                ShowBookDetails(
                                    onPressed: () {
                                      FavouriteCubit.get(context)
                                          .addToFavourite(
                                              id: cubit.booksList[index].id!);
                                    },
                                    products: cubit.booksList[index]));
                          },
                          allProductModel: cubit.searchController.text.isEmpty
                              ? cubit.booksList[index]
                              : cubit.searchList[index]),
                    ),
                separatorBuilder: (context, index) => const SizedBox.shrink(),
                itemCount: cubit.searchController.text.trim().isEmpty
                    ? cubit.booksList.length
                    : cubit.searchList.length); //cubit.booksList.length
      },
    );
  }
}
