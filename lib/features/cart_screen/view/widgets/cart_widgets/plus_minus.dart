import 'package:book_store/features/cart_screen/view_model/cubits/cart_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/components/widgets/text_custom.dart';
import '../../../../../core/utils/colors.dart';
import '../../../view_model/cubits/cart_cubit/states.dart';

class PlusAndMinus extends StatelessWidget {
  const PlusAndMinus({super.key, this.plus, this.minus, required this.quantity,});

  final void Function()? plus;
  final void Function()? minus;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        return Container(
          alignment: Alignment.topCenter,
          width: 110.w,
          height: 32.h,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: plus,
                icon: Icon(
                  Icons.add,
                  color: AppColors.kBlack,
                  size: 25.sp,
                ),
              ),
              TextCustom(
                text: quantity.toString(),
                color: AppColors.kBlack,
                fontSize: 20.sp,
              ),
              IconButton(
                onPressed: quantity == 1 ? null : minus,
                icon: Icon(
                  Icons.remove,
                  color: quantity == 1 ? AppColors.kGrey : AppColors.kBlack,
                  size: 25.sp,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
