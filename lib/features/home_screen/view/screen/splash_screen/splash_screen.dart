import 'package:book_store/core/utils/navigation.dart';
import 'package:book_store/features/home_screen/view/screen/home_screen.dart';
import 'package:book_store/features/home_screen/view_model/cubit/best_seller_cubit/best_seller_cubit.dart';
import 'package:book_store/features/home_screen/view_model/cubit/slider_cubit/slider_cubit.dart';
import 'package:flutter/material.dart';

import '../../../view_model/cubit/categories_cubit/categories_cubit.dart';
import '../../../view_model/cubit/new_arrival_cubit/slider_cubit.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigation.pushAndReplace(context, const HomeScreen());
    });
    SlidersCubit.get(context).getSliders();
    BestSellerCubit.get(context).getBestSeller();
    CategoriesCubit.get(context).getCategories();
    // CategoriesCubit.get(context).getProductsByCategories(2);
    NewArrivalCubit.get(context).getNewArrival();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const Center(
          child: Image(
            image: AssetImage('assets/images/ktaby.png'),
          ),
        ),
      ),
    );
  }
}
