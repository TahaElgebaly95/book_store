// import 'package:book_store/core/utils/colors.dart';
// import 'package:book_store/features/home_screen/model/categories/categories_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class DetailsWidget extends StatelessWidget {
//   DetailsWidget({super.key});
//
//   Categories? categories;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: EdgeInsets.all(15.0.sp),
//         child:
//         Container(
//           height: 180,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             border: Border.all(color: AppColors.kGrey),
//             borderRadius: BorderRadius.circular(15.r),
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15.r),
//                     image: DecorationImage(
//                       image: NetworkImage('${categories?.}'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               const Expanded(
//                 flex: 3,
//                 child: Column(
//                   children: [],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
