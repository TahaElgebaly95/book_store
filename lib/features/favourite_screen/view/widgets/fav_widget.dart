import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cart_screen/view_model/cubits/cart_cubit/cubit.dart';
import '../../view_model/cubits/fav_cubit/cubit.dart';
import '../../view_model/cubits/fav_cubit/states.dart';
import 'favourite_widget.dart';

class FavWidget extends StatelessWidget {
  const FavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit, FavouriteState>(
      builder: (context, state) {
        var cubit = FavouriteCubit.get(context);
        return cubit.favouriteList.isEmpty ? const Center(child: Text('No Favourite Books')) : ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
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
    );
  }
}
