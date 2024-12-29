import 'package:book_store/core/data/local/shared_helper.dart';
import 'package:book_store/core/data/local/shared_keys.dart';
import 'package:book_store/core/data/network/helper/dio_helper.dart';
import 'package:book_store/core/data/network/helper/endpoints.dart';
import 'package:book_store/features/order_screen/model/governrate_model.dart';
import 'package:book_store/features/order_screen/model/place_order_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/order_history_model.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitialState());

  static OrderCubit get(context) => BlocProvider.of(context);

  TextEditingController nameCheckoutController = TextEditingController();
  TextEditingController emailCheckoutController = TextEditingController();
  TextEditingController phoneCheckoutController = TextEditingController();
  TextEditingController addressCheckoutController = TextEditingController();
  TextEditingController cityCheckoutController = TextEditingController();
  TextEditingController governorateCheckoutController = TextEditingController();

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

  var selectItem = 0;

  void changeSelectItem(int? value) {
    selectItem = value!;
    emit(ChangeGovernorate());
  }

  List<DataGovernorates> dataGovernorates = [];
  GovernRateModel? governRateModel;

  Future<void> getGovernoratesList() async {
    emit(GovernoratesLoading());
    await DioHelper.getData(endpoint: EndPoints.governorates).then((value) {
      governRateModel = GovernRateModel.fromJson(value.data);
      dataGovernorates = governRateModel!.data!;
      emit(GovernoratesSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GovernoratesError());
    });
  }

  PlaceOrderModel? placeOrderModel;
  Future<void> placeOrder() async {
    emit(PlaceOrderLoadingState());
    await DioHelper.post(body: {
      'name': nameCheckoutController.text,
      'email': emailCheckoutController.text,
      'phone': phoneCheckoutController.text,
      'address': addressCheckoutController.text,
      'city': cityCheckoutController.text,
      'governorate_id': dataGovernorates[selectItem].id,
    }, endpoint: EndPoints.placeOrder, withToken: true)
        .then((value) {
      placeOrderModel = PlaceOrderModel.fromJson(value.data);
      print(placeOrderModel!.message);
      emit(PlaceOrderSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(PlaceOrderErrorState());
    });
  }

  OrderHistoryModel? orderHistoryList;
  List<Orders> orders = [];

  Future<void> orderHistory() async {
    emit(OrderHistoryLoadingState());
    await DioHelper.getData(endpoint: EndPoints.orderHistory, withToken: true)
        .then((value) {
      orderHistoryList = OrderHistoryModel.fromJson(value.data);
      orders = orderHistoryList!.data!.orders!;
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
