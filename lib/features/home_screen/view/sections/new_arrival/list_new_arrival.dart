import 'package:book_store/features/home_screen/view_model/cubit/new_arrival_cubit/slider_cubit.dart';
import 'package:book_store/features/home_screen/view_model/cubit/new_arrival_cubit/slider_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'new_arrival_widget.dart';

class ListOfNewArrival extends StatelessWidget {
  const ListOfNewArrival({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewArrivalCubit, NewANewArrivalState>(
      builder: (context, state) {
        var cubit = NewArrivalCubit.get(context);
        return ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                NewArrivalWidget(products: cubit.newArrival[index]),
            separatorBuilder: (context, index) => SizedBox(
                  width: 0.w,
                ),
            itemCount: cubit.newArrival.length);
      },
      listener: (context, state) {},
    );
  }
}
