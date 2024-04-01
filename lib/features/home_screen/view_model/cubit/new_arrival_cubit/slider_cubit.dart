import 'package:book_store/core/data/network/helper/dio_helper.dart';
import 'package:book_store/core/data/network/helper/endpoints.dart';
import 'package:book_store/features/home_screen/view_model/cubit/new_arrival_cubit/slider_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/products/all_products_model.dart';

class NewArrivalCubit extends Cubit<NewANewArrivalState> {
  NewArrivalCubit() : super(NewArrivalInitial());

  static NewArrivalCubit get(context) =>
      BlocProvider.of<NewArrivalCubit>(context);

  List<Products> newArrival = [];

  Future<void> getNewArrival() async {
    emit(NewArrivalLoading());
    await DioHelper.getData(endpoint: EndPoints.newArrival).then((value) {
      for (var e in value.data['data']['products']) {
        newArrival.add(Products.fromJson(e));
        emit(NewArrivalSuccess());
      }
    }).catchError((error) {
      print(error.toString());
      emit(NewArrivalError(error.toString()));
    });
  }
}
