import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/features/home_screen/view/screen/home_screen.dart';
import 'package:book_store/features/profile_screen/view/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentScreen = 0;
  List<Widget> screens = [
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        selectedFontSize: 20.sp,
        selectedIconTheme: IconThemeData(
          size: 25.sp,
          color: AppColors.primaryColor,
        ),
        elevation: 0,
        unselectedIconTheme: IconThemeData(size: 20.sp, color: AppColors.kGrey),
        currentIndex: currentScreen,
        onTap: (value) {
          setState(() {
            currentScreen = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColors.kGrey.withOpacity(0.5),
            icon: const Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.kGrey.withOpacity(0.5),
            icon: const Icon(Icons.book),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.kGrey.withOpacity(0.5),
            icon: const Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.kGrey.withOpacity(0.5),
            icon: const Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.kGrey.withOpacity(0.5),
            icon: const Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: screens[currentScreen],
    );
  }
}
