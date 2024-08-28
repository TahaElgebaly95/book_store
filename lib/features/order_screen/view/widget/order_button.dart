import 'package:book_store/core/utils/show_toast.dart';
import 'package:book_store/features/order_screen/view_model/cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/widgets/text_custom.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/navigation.dart';
import '../../../bottom_nav_bar/bottom_nav_bar.dart';
import '../../../cart_screen/view_model/cubits/cart_cubit/cubit.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
             OrderCubit.get(context).placeOrder();
             OrderCubit.get(context).orderHistory();
            Navigation.push(context, const BottomNavBarScreen());
            customShowToast('Order Placed successfully!');
          },
          child: TextCustom(
            text: 'Order Now!',
            fontSize: 15.sp,
            color: AppColors.kBlack,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
