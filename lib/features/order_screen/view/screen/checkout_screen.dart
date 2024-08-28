
import 'package:book_store/features/order_screen/view/widget/order_details/address.dart';
import 'package:book_store/features/order_screen/view/widget/order_details/city.dart';
import 'package:book_store/features/order_screen/view/widget/order_details/name.dart';
import 'package:book_store/features/order_screen/view/widget/order_details/phone.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../view_model/cubit/order_cubit/order_cubit.dart';
import '../../view_model/cubit/order_cubit/order_state.dart';
import '../widget/order_details/email.dart';
import '../widget/order_details/governorates/governroue_widget.dart';
import '../widget/order_details/order_button.dart';

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
            child: SingleChildScrollView(
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
                  const GovernoratesWidget(),
                  SizedBox(height: 10.h),
                  const CheckoutButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
