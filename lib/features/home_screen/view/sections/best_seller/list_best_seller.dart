import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../view_model/cubit/best_seller_cubit/best_seller_cubit.dart';
import '../../../view_model/cubit/best_seller_cubit/best_seller_state.dart';
import 'best_seller_widget.dart';

class ListOfBestSeller extends StatelessWidget {
  const ListOfBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BestSellerCubit, BestSellerState>(
      builder: (context, state) {
        var cubit = BestSellerCubit.get(context);

        return ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                BestSellerWidget(products: cubit.bestSellerList[index]),
            separatorBuilder: (context, index) => SizedBox(
                  width: 0.w,
                ),
            itemCount: cubit.bestSellerList.length);
      },
      listener: (context, state) {},
    );
  }
}
