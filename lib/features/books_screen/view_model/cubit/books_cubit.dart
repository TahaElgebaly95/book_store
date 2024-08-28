import 'package:book_store/core/data/network/helper/endpoints.dart';
import 'package:book_store/features/favourite_screen/view_model/cubits/fav_cubit/cubit.dart';
import 'package:book_store/features/home_screen/model/products/all_products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/data/network/helper/dio_helper.dart';
import 'books_states.dart';

class BooksCubit extends Cubit<BooksStates> {
  BooksCubit() : super(InitialBooksStates());

  static BooksCubit get(context) => BlocProvider.of(context);

  bool isFaV = false;
  void changeFaVColor() {
    isFaV = !isFaV;
    emit(ChangeFavColorSuccessState());
  }

  List<Products> booksList = [];
  AllProductModel allProductModel = AllProductModel();

  Future<void> getBooks() async {
    emit(LoadingBooksStates());
    await DioHelper.getData(
      endpoint: EndPoints.products,
    ).then(
      (value) {
        allProductModel = AllProductModel.fromJson(value.data);
        booksList = allProductModel.data!.products!;
        emit(SuccessBooksStates());
      },
    ).catchError((error) {
      emit(ErrorBooksStates(error.toString()));
    });
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
