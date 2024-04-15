import 'package:book_store/core/data/network/helper/endpoints.dart';
import 'package:book_store/features/home_screen/model/products/all_products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/data/network/helper/dio_helper.dart';
import 'books_states.dart';

class BooksCubit extends Cubit<BooksStates> {
  BooksCubit() : super(InitialBooksStates());

  static BooksCubit get(context) => BlocProvider.of(context);

  List<Products> booksList = [];

  Future<void> getBooks() async {
    emit(LoadingBooksStates());
    await DioHelper.getData(
      endpoint: EndPoints.products,
    ).then(
      (value) {
        for (var e in value.data['data']['products']) {
          booksList.add(Products.fromJson(e));
        }
        emit(SuccessBooksStates());
      },
    ).catchError((error) {});
  }

  TextEditingController searchController = TextEditingController();

  List<Products> searchList = [];

  Future<void> getBooksBySearch(String e) async {
    searchList.clear();
    emit(LoadingBooksStates());
    await DioHelper.getData(
        endpoint: EndPoints.productsSearch,
        queryParameters: {'name': searchController.text}).then(
      (value) {
        for (var i in booksList) {
          if (i.name!
              .trim()
              .toLowerCase()
              .contains(e.trim().toLowerCase())) {
            searchList.add(i);
          }
        }
        emit(SuccessBooksStates());
      },
    ).catchError((error) {});
  }
}
