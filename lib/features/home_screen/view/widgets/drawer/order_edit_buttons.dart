
import 'package:flutter/material.dart';
import '../../../../../core/components/widgets/text_custom.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/navigation.dart';
import '../../../../order_screen/view/screen/order_history.dart';
import '../../../../profile_screen/view/screen/show_update_profile_screen.dart';

class OrderAndEditButtons extends StatelessWidget {
  const OrderAndEditButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
             Navigation.push(context,  const OrderHistory());
          },
          leading: const Icon(
            Icons.history,
            color: AppColors.kGrey,
            size: 35,
          ),
          title: const TextCustom(
            text: 'Order History',
            color: AppColors.kGrey,
            fontSize: 20,

          ),
        ),
        const Divider(color: AppColors.kGrey, endIndent: 30, indent: 20),
        ListTile(
          onTap: () {
            Navigation.push(context, const ProfileScreen());
          },
          leading: const Icon(
            Icons.edit,
            color: AppColors.kGrey,
            size: 35,
          ),
          title: const TextCustom(
            text: 'Edit Prodile',
            color: AppColors.kGrey,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
