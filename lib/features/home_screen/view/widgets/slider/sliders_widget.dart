import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../view_model/cubit/slider_cubit/slider_cubit.dart';
import '../../../view_model/cubit/slider_cubit/slider_state.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlidersCubit, SliderState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<SlidersCubit>(context);
        return state is SliderLoading
            ? const Center(child: CircularProgressIndicator())
            : CarouselSlider(
                items: [
                    ...cubit.slidersList.map(
                      (e) => Image.network(
                        e.image.toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                options: CarouselOptions(
                  height: 150.h,
                  //aspectRatio: .5,
                  viewportFraction: .9,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {},
                  scrollPhysics: const BouncingScrollPhysics(),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                ));
      },
    );
  }
}
