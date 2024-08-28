import 'package:book_store/core/components/widgets/text_custom.dart';
import 'package:book_store/features/cart_screen/view_model/cubits/cart_cubit/cubit.dart';
import 'package:book_store/features/favourite_screen/view/widgets/favourite_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../view_model/cubits/fav_cubit/cubit.dart';
import '../../view_model/cubits/fav_cubit/states.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  void initState() {
    super.initState();
    FavouriteCubit.get(context).showFavourite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextCustom(
          text: 'Favourite',
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
      ),
      body: BlocConsumer<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          var cubit = FavouriteCubit.get(context);
          return ListView.separated(
            itemBuilder: (context, index) {
              return FavouriteWidget(
                name: cubit.favouriteList[index].name ?? '',
                image: cubit.favouriteList[index].image ?? '',
                price: cubit.favouriteList[index].price.toString(),
                description: cubit.favouriteList[index].description ?? '',
                favButton: () {
                  cubit.removeFromFavourite(id: cubit.favouriteList[index].id!);
                },
                cartButton: () {
                  CartCubit.get(context)
                      .addToCart(id: cubit.favouriteList[index].id!);
                },
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemCount: cubit.favouriteList.length,
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
