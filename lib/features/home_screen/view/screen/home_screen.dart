import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/appbar_custom.dart';
import '../widgets/best_seller/section_best_seller.dart';
import '../widgets/categories/categories_section.dart';
import '../widgets/drawer/drawer.dart';
import '../widgets/new_arrival/sction_new_arrival.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const AppBarCustom(),
      ),
      body: ListView(
        children: [
          SizedBox(height: 15.h),
         // CarouselView(itemExtent: MediaQuery.of(context).size.width, children: [
         //   Image.asset('assets/images/1.jpg'),
         // ]),
         // const SliderWidget(),
          SizedBox(height: 15.h),
          const SectionBestSeller(),
          SizedBox(height: 5.h),
          const SectionCategories(),
          SizedBox(height: 15.h),
          const SectionNewArrival(),
        ],
      ),
    );
  }
}
