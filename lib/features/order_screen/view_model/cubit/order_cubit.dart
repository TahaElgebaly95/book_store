import 'package:book_store/core/data/local/shared_helper.dart';
import 'package:book_store/core/data/local/shared_keys.dart';
import 'package:book_store/core/data/network/helper/dio_helper.dart';
import 'package:book_store/core/data/network/helper/endpoints.dart';
import 'package:book_store/features/order_screen/model/order_history_model.dart';
import 'package:book_store/features/order_screen/view/screen/order_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitialState());

  static OrderCubit get(context) => BlocProvider.of(context);

  TextEditingController nameCheckoutController = TextEditingController();
  TextEditingController emailCheckoutController = TextEditingController();
  TextEditingController phoneCheckoutController = TextEditingController();
  TextEditingController addressCheckoutController = TextEditingController();
  TextEditingController cityCheckoutController = TextEditingController();

  Future<void> checkout() async {
    emit(CheckoutLoadingState());
    await DioHelper.getData(endpoint: EndPoints.checkout, withToken: true)
        .then((value) {
      SharedHelper.set(
          key: SharedKey.nameCheckout, value: nameCheckoutController.text);
      SharedHelper.set(
          key: SharedKey.emailCheckout, value: emailCheckoutController.text);
      SharedHelper.set(
          key: SharedKey.phoneCheckout, value: phoneCheckoutController.text);
      SharedHelper.set(
          key: SharedKey.addressCheckout,
          value: addressCheckoutController.text);
      SharedHelper.set(
          key: SharedKey.cityCheckout, value: cityCheckoutController.text);
      emit(CheckoutSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CheckoutErrorState());
    });
  }

  Future<void> placeOrder() async {
    emit(PlaceOrderLoadingState());
    await DioHelper.post(body: {
      'name': SharedHelper.get(key: SharedKey.nameCheckout),
      'email': SharedHelper.get(key: SharedKey.emailCheckout),
      'phone': SharedHelper.get(key: SharedKey.phoneCheckout),
      'address': SharedHelper.get(key: SharedKey.addressCheckout),
      'city': SharedHelper.get(key: SharedKey.cityCheckout),
      'governorate_id': 10
    }, endpoint: EndPoints.placeOrder, withToken: true)
        .then((value) {
      emit(PlaceOrderSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(PlaceOrderErrorState());
    });
  }

  OrderHistoryModel orderHistoryList = OrderHistoryModel();
  List<Orders> orders = [];

  Future<void> orderHistory() async {
    emit(OrderHistoryLoadingState());
    await DioHelper.getData(endpoint: EndPoints.orderHistory, withToken: true)
        .then((value) {
      orderHistoryList = OrderHistoryModel.fromJson(value.data);
      orders = orderHistoryList.data!.orders!;
      emit(OrderHistorySuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(OrderHistoryErrorState());
    });
  }

// Future<void> showSingleOrder() {
//   emit(ShowOrderLoadingState());
//   return DioHelper.getData(endpoint: EndPoints.showOrder,withToken: true).then((value) {
//     emit(ShowOrderSuccessState());
//   }).catchError((error) {
//     print(error.toString());
//     emit(ShowOrderErrorState());
//   });
// }
}
