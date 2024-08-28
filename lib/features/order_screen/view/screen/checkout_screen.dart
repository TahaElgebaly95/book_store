import 'package:book_store/features/order_screen/view/widget/address.dart';
import 'package:book_store/features/order_screen/view/widget/city.dart';
import 'package:book_store/features/order_screen/view/widget/email.dart';
import 'package:book_store/features/order_screen/view/widget/name.dart';
import 'package:book_store/features/order_screen/view/widget/order_button.dart';
import 'package:book_store/features/order_screen/view/widget/phone.dart';
import 'package:book_store/features/order_screen/view_model/cubit/order_cubit.dart';
import 'package:book_store/features/order_screen/view_model/cubit/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          var cubit = OrderCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CheckoutName(),
                SizedBox(height: 10.h),
                const CheckoutEmail(),
                SizedBox(height: 10.h),
                const CheckoutPhone(),
                SizedBox(height: 10.h),
                const CheckoutAddress(),
                SizedBox(height: 10.h),
                const CheckoutCity(),
                SizedBox(height: 10.h),
                const CheckoutButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
