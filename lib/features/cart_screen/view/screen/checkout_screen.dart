import 'package:book_store/features/cart_screen/view_model/cubits/cart_cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../profile_screen/view/widgets/address.dart';
import '../../view_model/cubits/cart_cubit/states.dart';


class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            // Name(),
            // SizedBox(height: 7.h),
            // Email(),
            // SizedBox(height: 7.h),
            // const Phone(),
            // SizedBox(height: 8.h),
            // const City(),
            // SizedBox(height: 5.h),
            const Address(),
          ],
        );
      },
    );
  }
}
