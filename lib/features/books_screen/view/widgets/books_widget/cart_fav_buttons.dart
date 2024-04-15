import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartAndFavButtons extends StatelessWidget {
  const CartAndFavButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_outlined,
              size: 30.sp,
            )),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_shopping_cart_outlined,
              size: 30.sp,
            )),
      ],
    );
  }
}
