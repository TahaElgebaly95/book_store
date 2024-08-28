import 'package:book_store/core/utils/navigation.dart';
import 'package:book_store/features/order_screen/view/screen/checkout_screen.dart';
import 'package:book_store/features/cart_screen/view_model/cubits/cart_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/components/widgets/text_custom.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../order_screen/view_model/cubit/order_cubit.dart';
import '../../../view_model/cubits/cart_cubit/states.dart';

class CheckoutSection extends StatelessWidget {
  const CheckoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          alignment: Alignment.center,
          width: double.infinity,
          height: 60.h,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(18.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextCustom(
                text:
                    'Total price is ${CartCubit.get(context).cartModel.data?.total.toString()} L.E',
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
              ElevatedButton(
                onPressed: () {
                  OrderCubit.get(context).checkout();
                  Navigation.push(context, const CheckoutScreen());
                },
                child: TextCustom(
                  text: 'Checkout',
                  fontSize: 15.sp,
                  color: AppColors.kBlack,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
