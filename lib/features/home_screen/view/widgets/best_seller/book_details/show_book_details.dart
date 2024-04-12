import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/features/home_screen/model/products/all_products_model.dart';
import 'package:book_store/features/home_screen/view/widgets/best_seller/book_details/container_of_image.dart';
import 'package:book_store/features/home_screen/view/widgets/best_seller/book_details/details_of_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/components/widgets/elevated_button.dart';

class ShowBookDetails extends StatelessWidget {
  ShowBookDetails({super.key, required this.products});
  Products products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: AppColors.kWhite),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ContainerOfImage(imageUrl: '${products.image}'),
                      Positioned(
                        top: 35.h,
                        right: 20.w,
                        child: CircleAvatar(
                          radius: 30.r,
                          backgroundColor:
                              AppColors.kTransparent.withOpacity(.5),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border_outlined,
                              color: AppColors.kRed,
                              size: 35.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0.sp),
                    child: DetailsOfBook(
                      products: products,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomElevatedButton(
            nameOfButton: 'Add to Cart',
            onPressed: () {},
            backgroundColor: AppColors.primaryColor,
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
