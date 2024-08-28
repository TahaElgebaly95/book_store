import 'package:book_store/features/books_screen/view/widgets/books_widget/cart_fav_buttons.dart';
import 'package:book_store/features/books_screen/view/widgets/books_widget/container_of_widget.dart';
import 'package:book_store/features/books_screen/view/widgets/books_widget/details_texts.dart';
import 'package:book_store/features/books_screen/view/widgets/books_widget/discount_container.dart';
import 'package:book_store/features/home_screen/model/products/all_products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksWidget extends StatelessWidget {
  const BooksWidget(
      {super.key,
      required this.allProductModel,
      this.onTap,
      this.favButton,
      this.cartButton});

  final Products allProductModel;
  final void Function()? onTap;
  final void Function()? favButton;
  final void Function()? cartButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: onTap,
        child: ContainerOfWidget(
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child:
                      DiscAndImageContainer(allProductModel: allProductModel)),
              SizedBox(width: 10.w),
              Expanded(
                  flex: 2,
                  child: DetailsTexts(
                    allProductModel: allProductModel,
                  )),
              Expanded(
                  flex: 1,
                  child: CartAndFavButtons(
                    cartButton:cartButton,
                    favButton: favButton,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
