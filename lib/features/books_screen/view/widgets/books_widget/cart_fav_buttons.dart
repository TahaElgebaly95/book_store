import 'package:book_store/features/favourite_screen/view_model/cubits/fav_cubit/cubit.dart';
import 'package:book_store/features/favourite_screen/view_model/cubits/fav_cubit/states.dart';
import 'package:book_store/features/home_screen/model/products/all_products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartAndFavButtons extends StatelessWidget {
  CartAndFavButtons({super.key, this.favButton, this.cartButton});

  final void Function()? favButton;
  final void Function()? cartButton;
  Products? productsId;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      builder: (context, state) {
        var cubit = FavouriteCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
                onPressed: favButton,
                icon: productsId != null ? Icon(Icons.favorite, size: 30.sp) : Icon(
                        Icons.favorite_border_outlined,
                        size: 30.sp,
                      )),
            const Spacer(),
            IconButton(
              onPressed: cartButton,
              icon: Icon(
                Icons.add_shopping_cart_outlined,
                size: 30.sp,
              ),
            ),
          ],
        );
      },
    );
  }
}
