import 'package:book_store/core/utils/colors.dart';
import 'package:book_store/features/books_screen/view/screen/BooksScreen.dart';
import 'package:book_store/features/cart_screen/view/screen/cartScreen.dart';
import 'package:book_store/features/favourite_screen/view/screen/FavScreen.dart';
import 'package:book_store/features/home_screen/view/screen/home_screen.dart';
import 'package:book_store/features/profile_screen/view/screen/show_update_profile_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentScreen = 0;
  List<Widget> screens = [
    const HomeScreen(),
     const BooksScreen(),
    const FavScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        color: AppColors.kBlack,
        style: TabStyle.react,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        initialActiveIndex: currentScreen,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.book, title: 'Books'),
          TabItem(icon: Icons.favorite, title: 'Favourite'),
          TabItem(icon: Icons.shopping_cart, title: 'Cart'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        onTap: (value) {
          setState(() {
            currentScreen = value;
          });
        },
      ),
      body: screens[currentScreen],
    );
  }
}
