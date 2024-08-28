import 'package:book_store/features/order_screen/view_model/cubit/order_cubit.dart';
import 'package:book_store/features/order_screen/view_model/cubit/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/widgets/text_form_field_custom.dart';
import '../../../../core/data/local/shared_helper.dart';
import '../../../../core/data/local/shared_keys.dart';
import '../../../../core/utils/colors.dart';

class CheckoutName extends StatelessWidget {
  const CheckoutName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        var cubit = OrderCubit.get(context);
        return CustomTextFormField(
          //  enabled: ProfileCubit.get(context).isEditing,
          border: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 2, color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(12.r)),
           controller: cubit.nameCheckoutController,
          hintText: cubit.nameCheckoutController.text.isEmpty ? 'Name' : cubit.nameCheckoutController.text,
          labelText: cubit.nameCheckoutController.text.isEmpty ? 'Name' : '${SharedHelper.get(key: SharedKey.nameCheckout)}',
          hintTextStyle: const TextStyle(color: AppColors.primaryColor),
          labelTextStyle: const TextStyle(color: AppColors.primaryColor),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(
            Icons.drive_file_rename_outline_sharp,
            color: AppColors.primaryColor,
          ),
        );
      },
    );
  }
}
