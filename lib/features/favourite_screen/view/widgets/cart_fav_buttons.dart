import 'package:book_store/features/favourite_screen/view_model/cubits/fav_cubit/cubit.dart';
import 'package:book_store/features/favourite_screen/view_model/cubits/fav_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';

class FavoriteAndCartButtons extends StatelessWidget {
  const FavoriteAndCartButtons(
      {super.key,
      this.favButton,
      required this.favColor,
      required this.carColor,
      this.cartButton});

  final void Function()? favButton;
  final Color favColor;
  final Color carColor;
  final void Function()? cartButton;

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
                color: AppColors.kRed,
                icon: Icon(
                  Icons.favorite,
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
