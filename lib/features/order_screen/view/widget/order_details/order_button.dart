import 'package:book_store/core/utils/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/components/widgets/text_custom.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/navigation.dart';
import '../../../../bottom_nav_bar/bottom_nav_bar.dart';
import '../../../../cart_screen/view_model/cubits/cart_cubit/cubit.dart';
import '../../../view_model/cubit/order_cubit/order_cubit.dart';
import '../../../view_model/cubit/order_cubit/order_state.dart';

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
        BlocConsumer<OrderCubit, OrderState>(
          builder: (context, state) {
            var cubit = OrderCubit.get(context);
            return ElevatedButton(
              onPressed: () {
                cubit.placeOrder();
              },
              child: TextCustom(
                text: 'Order Now!',
                fontSize: 15.sp,
                color: AppColors.kBlack,
                fontWeight: FontWeight.bold,
              ),
            );
          },
          listener: (context, state) {
            if (state is PlaceOrderSuccessState) {
              Navigation.pushAndReplace(context, const BottomNavBarScreen());
              OrderCubit.get(context).orderHistory();
              customShowToast('Order Placed successfully!');
            }
          },
        )
      ],
    );
  }
}
