import 'package:book_store/core/data/network/helper/endpoints.dart';
import 'package:book_store/features/home_screen/model/categories/categories_model.dart';
import 'package:book_store/features/home_screen/view_model/cubit/categories_cubit/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/data/network/helper/dio_helper.dart';
import '../../../model/categories/ProductsDetails.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  static CategoriesCubit get(context) =>
      BlocProvider.of<CategoriesCubit>(context);

  List<Categories> categoriesList = [];

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    await DioHelper.getData(endpoint: EndPoints.categories).then((value) {
      for (var e in value.data['data']['categories']) {
        categoriesList.add(Categories.fromJson(e));
      }
      emit(CategoriesSuccess());
    }).catchError((error) {
      emit(CategoriesError(error: error.toString()));
    });
  }

  List<ProductsDetails> productsList = [];

  Future<void> getProductsByCategories(int id) async {
    productsList = [];
    emit(GetProductsByCategoriesLoading());
    await DioHelper.getData(endpoint: '${EndPoints.categories}/$id')
        .then((value) {
      for (var e in value.data['data']['products']) {
        productsList.add(ProductsDetails.fromJson(e));
      }
      emit(GetProductsByCategoriesSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetProductsByCategoriesError(error: error.toString()));
    });
  }
}
