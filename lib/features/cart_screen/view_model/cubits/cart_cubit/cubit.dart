import 'package:book_store/features/cart_screen/model/cart_model.dart';
import 'package:book_store/features/cart_screen/view_model/cubits/cart_cubit/states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/data/network/helper/dio_helper.dart';
import '../../../../../core/data/network/helper/endpoints.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());

  static CartCubit get(context) => BlocProvider.of(context);

  //List<Products> cartProducts = [];
  List<CartItems> cartList = [];
  CartModel cartModel = CartModel();

  Future<void> showCart() async {
    cartList.clear();
    emit(CartLoadingState());
    await DioHelper.getData(endpoint: EndPoints.cart, withToken: true)
        .then((value) {
      cartModel = CartModel.fromJson(value.data);
      cartList = cartModel.data!.cartItems!;
      emit(CartSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(CartErrorState());
    });
  }

  Future<void> addToCart({required int id}) async {
    emit(CartAddedLoadingState());
    await DioHelper.post(
            endpoint: EndPoints.addToCart,
            body: {"product_id": "$id"},
            withToken: true)
        .then((value) {
       showCart();
      emit(CartAddedSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      if (error is DioException) {
        if (kDebugMode) {
          print(error.response?.data);
        }
      }
      emit(CartAddedErrorState());
    });
  }

  Future<void> removeFromCart({required int id}) async {
    emit(CartRemovedLoadingState());
    await DioHelper.post(
            endpoint: EndPoints.removeFromCart,
            body: {"cart_item_id": id},
            withToken: true)
        .then((value) {
      emit(CartRemovedSuccessState());
      showCart();
    }).catchError((error) {
      if (error is DioException) {
        if (kDebugMode) {
          print(error.response?.data['message']);
        }
      }
      if (kDebugMode) {
        print(error.toString());
      }
      emit(CartRemovedErrorState());
    });
  }

  void updateCart({required int id, required int quantity})  {
    emit(CartUpdatedLoadingState());
     DioHelper.post(
            endpoint: EndPoints.updateCart,
            body: {"cart_item_id": "$id", "quantity": "$quantity"},
            withToken: true)
        .then((value) {
      showCart();
      emit(CartUpdatedSuccessState());
    }).catchError((error) {
      if (error is DioException) {
        print(error.response?.data);
      }
      if (kDebugMode) {
        print(error.toString());
      }
      emit(CartUpdatedErrorState());
    });
  }
}
