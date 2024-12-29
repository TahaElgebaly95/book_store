import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/widgets/text_form_field_custom.dart';
import '../../../../core/utils/colors.dart';
import '../../view_model/cubit/order_cubit/order_cubit.dart';
import '../../view_model/cubit/order_cubit/order_state.dart';

class CheckoutCity extends StatelessWidget {
  const CheckoutCity({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return CustomTextFormField(
          //  enabled: ProfileCubit.get(context).isEditing,
          border: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 2, color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(12.r)),
          // controller: cubit.nameController,
          hintText: 'City',
          labelText: 'City',
          hintTextStyle: const TextStyle(color: AppColors.primaryColor),
          labelTextStyle: const TextStyle(color: AppColors.primaryColor),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(
            Icons.location_city,
            color: AppColors.primaryColor,
          ),
        );
      },
    );
  }
}
