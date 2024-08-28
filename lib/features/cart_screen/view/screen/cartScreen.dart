import 'package:book_store/core/components/widgets/text_custom.dart';
import 'package:book_store/features/cart_screen/view/widgets/cart_widgets/cart_container.dart';
import 'package:book_store/features/cart_screen/view/widgets/cart_widgets/name_fav_icon.dart';
import 'package:book_store/features/cart_screen/view/widgets/cart_widgets/checkout_section.dart';
import 'package:book_store/features/cart_screen/view/widgets/cart_widgets/price_discount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../books_screen/view/widgets/books_widget/container_of_widget.dart';
import '../../view_model/cubits/cart_cubit/cubit.dart';
import '../../view_model/cubits/cart_cubit/states.dart';
import '../widgets/cart_widgets/delete_dialog.dart';
import '../widgets/cart_widgets/plus_minus.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    CartCubit.get(context).showCart();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextCustom(
            text: 'Cart', fontSize: 25.sp, fontWeight: FontWeight.bold),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          var cubit = CartCubit.get(context);
          return cubit.cartList.isEmpty
              ? Center(
                  child: TextCustom(
                    text: 'Cart is empty',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ContainerOfWidget(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: CartContainer(
                                      url: cubit
                                          .cartList[index].itemProductImage
                                          .toString()),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      NameAndDeleteIcon(
                                        bookName: cubit
                                            .cartList[index].itemProductName
                                            .toString(),
                                        delButton: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => ConfirmDelete(
                                                confirmDelete: () {
                                              cubit
                                                  .removeFromCart(
                                                    id: cubit.cartList[index]
                                                        .itemId!.toInt(),
                                                  )
                                                  .then(
                                                    (value) =>
                                                        Navigator.of(context)
                                                            .pop(),
                                                  );
                                            }),
                                          );
                                        },
                                      ),
                                      Row(
                                        children: [
                                          PlusAndMinus(
                                            quantity: cubit
                                                .cartList[index].itemQuantity!,
                                            plus: () {
                                              cubit.updateCart(
                                                  id: cubit
                                                      .cartList[index].itemId!,
                                                  quantity: cubit
                                                          .cartList[index]
                                                          .itemQuantity!.toInt() +
                                                      1);
                                            },
                                            minus: () {
                                              cubit.updateCart(
                                                  id: cubit
                                                      .cartList[index].itemId!,
                                                  quantity: cubit
                                                          .cartList[index]
                                                          .itemQuantity!.toInt() -
                                                      1);
                                            },
                                          ),
                                          const Spacer(),
                                          PriceAndDiscount(
                                            discount: cubit.cartList[index]
                                                .itemProductPrice
                                                .toString(),
                                            price: cubit.cartList[index]
                                                .itemProductPriceAfterDiscount
                                                .toString(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: cubit.cartList.length,
                      ),
                    ),
                    const CheckoutSection(),
                    SizedBox(height: 20.h),
                  ],
                );
        },
      ),
    );
  }
}
