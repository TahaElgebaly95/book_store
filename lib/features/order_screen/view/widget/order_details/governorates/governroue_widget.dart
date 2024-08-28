import 'package:book_store/core/components/widgets/text_custom.dart';
import 'package:book_store/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../view_model/cubit/order_cubit/order_cubit.dart';
import '../../../../view_model/cubit/order_cubit/order_state.dart';

class GovernoratesWidget extends StatefulWidget {
  const GovernoratesWidget({super.key});

  @override
  State<GovernoratesWidget> createState() => _GovernoratesWidgetState();
}

class _GovernoratesWidgetState extends State<GovernoratesWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        var cubit = OrderCubit.get(context);
        return DropdownButtonFormField(
          items: cubit.dataGovernorates
              .map((e) => DropdownMenuItem(
                    value: e.id,
                    child: Text('${e.governorateNameEn}'),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              cubit.selectItem = value!;
            });
          },
          hint: const TextCustom(
            text: 'Select Governorate',
            color: AppColors.primaryColor,
          ),
          style: TextStyle(
              color: AppColors.kBlack,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp),
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.location_on_outlined,
              color: AppColors.primaryColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide:const BorderSide(color: AppColors.kBlack),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: AppColors.kBlack),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
