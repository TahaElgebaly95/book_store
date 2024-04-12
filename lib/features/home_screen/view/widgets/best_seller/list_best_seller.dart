import 'package:book_store/core/utils/navigation.dart';
import 'package:book_store/features/home_screen/view/widgets/best_seller/book_details/show_book_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            itemBuilder: (context, index) => BestSellerWidget(
                onTap: () async {
                  Navigation.push(
                      context,
                      ShowBookDetails(
                          products: BestSellerCubit.get(context)
                              .bestSellerList[index]));
                },
                products: cubit.bestSellerList[index]),
            separatorBuilder: (context, index) => const SizedBox.shrink(),
            itemCount: cubit.bestSellerList.length);
      },
      listener: (context, state) {},
    );
  }
}
