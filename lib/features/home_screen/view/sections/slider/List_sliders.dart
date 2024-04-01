// import 'package:book_store/features/home_screen/view/screen/sections/slider/sliders_widget.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../view_model/cubit/slider_cubit/slider_cubit.dart';
// import '../../../../view_model/cubit/slider_cubit/slider_state.dart';
//
// class ListOfSliders extends StatelessWidget {
//   const ListOfSliders({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SlidersCubit, SliderState>(
//       builder: (context, state) {
//         var cubit = BlocProvider.of<SlidersCubit>(context);
//         return SizedBox(
//           height: 280.h,
//           child: ListView.separated(
//               shrinkWrap: true,
//               itemBuilder: (context, index) => const SliderWidget(),
//               separatorBuilder: (context, index) => SizedBox(
//                     width: 10.w,
//                   ),
//               itemCount: 1),
//         );
//       },
//       listener: (context, state) {},
//     );
//   }
// }
