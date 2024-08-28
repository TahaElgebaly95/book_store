import 'package:book_store/core/components/widgets/text_custom.dart';
import 'package:book_store/features/favourite_screen/view/widgets/fav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../view_model/cubits/fav_cubit/cubit.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  void initState() {
    super.initState();
    FavouriteCubit.get(context).showFavourite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextCustom(
            text: 'Favourite', fontWeight: FontWeight.bold, fontSize: 20.sp),
      ),
      body: ListView(
        shrinkWrap: true,
        children: const [FavWidget()],
      ),
    );
  }
}
