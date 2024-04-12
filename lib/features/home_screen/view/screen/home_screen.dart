import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/appbar_custom.dart';
import '../widgets/best_seller/section_best_seller.dart';
import '../widgets/categories/categories_section.dart';
import '../widgets/drawer/drawer.dart';
import '../widgets/new_arrival/sction_new_arrival.dart';
import '../widgets/slider/sliders_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
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
          const SliderWidget(),
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
