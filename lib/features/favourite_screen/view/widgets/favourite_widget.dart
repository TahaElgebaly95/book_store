import 'package:book_store/features/favourite_screen/view_model/cubits/fav_cubit/cubit.dart';
import 'package:book_store/features/favourite_screen/view_model/cubits/fav_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/widgets/text_custom.dart';
import '../../../books_screen/view/widgets/books_widget/container_of_widget.dart';
import 'cart_fav_buttons.dart';

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget(
      {super.key,
      this.favButton,
      required this.name,
      required this.image,
      required this.price,
      required this.description, this.cartButton});

  final void Function()? favButton;
  final void Function()? cartButton;
  final String name;
  final String image;
  final String price;
  final String description;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit, FavouriteState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = FavouriteCubit.get(context);
        return ContainerOfWidget(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextCustom(
                      text: name,
                      fontSize: 14.sp,
                    ),
                    TextCustom(
                      text: price.toString(),
                      fontSize: 14.sp,
                    ),
                    TextCustom(
                      text: description,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14.sp,
                    ),
                  ],
                ),
              ),
              FavoriteAndCartButtons(
                carColor: cubit.isFav ? Colors.red : Colors.grey,
                favColor: cubit.isFav ? Colors.grey : Colors.red,
                favButton: favButton,
                cartButton: cartButton,
              )
            ],
          ),
        );
      },
    );
  }
}
