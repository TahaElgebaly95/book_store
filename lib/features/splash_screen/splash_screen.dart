import 'package:book_store/core/utils/navigation.dart';
import 'package:book_store/features/auth_screen/view/screens/login_screen/login_screen.dart';
import 'package:book_store/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import '../../../../../core/data/local/shared_helper.dart';
import '../../../../../core/data/local/shared_keys.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      String? token = await SharedHelper.get(key: SharedKey.token);
      Navigation.pushAndReplace(
          context, token == null ? const LoginScreen() : const BottomNavBarScreen());
    });
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
