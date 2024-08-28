import 'package:book_store/core/data/network/helper/dio_helper.dart';
import 'package:book_store/core/data/network/helper/endpoints.dart';
import 'package:book_store/features/books_screen/view_model/cubit/books_cubit.dart';
import 'package:book_store/features/favourite_screen/view_model/cubits/fav_cubit/states.dart';
import 'package:book_store/features/home_screen/model/products/all_products_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteState());

  static FavouriteCubit get(context) => BlocProvider.of(context);

  bool isFav = false;

  void changeFav() {
    isFav = !isFav;
    emit(ChangeFavState());
  }

  List<Products> favouriteList = [];
  List<String> favId = [];

  Future<void> showFavourite() async {
    favouriteList = [];
    emit(FavouriteLoadingState());
    await DioHelper.getData(endpoint: EndPoints.wishlist, withToken: true)
        .then((value) {
      for (var element in value.data['data']['data']) {
        favouriteList.add(Products.fromJson(element));
      }
      emit(FavouriteSuccessState());
    }).catchError((error) {
      if (error is DioException) {
        print(error.response?.data);
      }
      print(error.toString());
      emit(FavouriteErrorState());
    });
  }

  Future<void> addToFavourite({required int id}) async {
    emit(FavouriteAddedLoadingState());
    await DioHelper.post(
            endpoint: EndPoints.addToWishlist,
            body: {"product_id": "$id"},
            withToken: true)
        .then((value) async {
      await showFavourite();
      emit(FavouriteAddedSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(FavouriteAddedErrorState());
    });
  }

  Future<void> removeFromFavourite({required int id}) async {
    emit(FavouriteRemovedLoadingState());
    await DioHelper.post(
            body: {"product_id": "$id"},
            endpoint: EndPoints.deleteWishlist,
            withToken: true)
        .then((value) async {
      await showFavourite();
      emit(FavouriteRemovedSuccessState());
    }).catchError((error) {
      print(error.toString());
      if (error is DioException) {
        print(error.response?.data);
      }
      emit(FavouriteRemovedErrorState());
    });
  }
}
