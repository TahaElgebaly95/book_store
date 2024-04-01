import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/data/network/helper/dio_helper.dart';
import '../../../../../core/data/network/helper/endpoints.dart';
import '../../../model/products/all_products_model.dart';
import 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit() : super(BestSellerInitial());

  static BestSellerCubit get(context) =>
      BlocProvider.of<BestSellerCubit>(context);

  List<Products> bestSellerList = [];

  Future<void> getBestSeller() async {
    emit(BestSellerLoading());
    await DioHelper.getData(endpoint: EndPoints.bestseller).then((value) {
      for (var e in value.data['data']['products']) {
        bestSellerList.add(Products.fromJson(e));
      }
      emit(BestSellerSuccess());
    }).catchError((error) {
      emit(BestSellerError(error.toString()));
    });
  }
}
