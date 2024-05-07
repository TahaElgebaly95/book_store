import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/components/widgets/text_custom.dart';
import '../../../../../core/utils/colors.dart';
import '../../../view_model/cubits/cart_cubit/cubit.dart';
import '../../../view_model/cubits/cart_cubit/states.dart';

class PriceAndDiscount extends StatelessWidget {
  const PriceAndDiscount({super.key, required this.discount, required this.price});

  final String discount;
  final String price;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      var cubit = CartCubit.get(context);
      return
        Column(
        children: [
          TextCustom(
            text: discount,
            decoration:
            TextDecoration.lineThrough,
            fontSize: 15.sp,
            color: AppColors.kGrey,
            fontWeight: FontWeight.bold,
          ),
          TextCustom(
            text: price,
            color: AppColors.primaryColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ],
      );
    },);
  }
}
