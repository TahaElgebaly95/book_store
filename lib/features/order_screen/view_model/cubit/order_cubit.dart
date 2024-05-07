import 'package:bloc/bloc.dart';
import 'package:book_store/core/data/network/helper/dio_helper.dart';
import 'package:book_store/core/data/network/helper/endpoints.dart';

import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitialState());

  Future<void> checkout() async {
    emit(CheckoutLoadingState());
    await DioHelper.getData(endpoint: EndPoints.checkout,withToken: true).then((value) {
      emit(CheckoutSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CheckoutErrorState());
    });
  }

  Future<void> placeOrder() async {
    emit(PlaceOrderLoadingState());
    await DioHelper.post(
            body: {},
            endpoint: EndPoints.placeOrder,
            withToken: true)
        .then((value) {
      emit(PlaceOrderSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(PlaceOrderErrorState());
    });
  }
}
