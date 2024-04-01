class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {}

class CategoriesError extends CategoriesState {
  final String error;
  CategoriesError({required this.error});
}

class GetProductsByCategoriesLoading extends CategoriesState {}

class GetProductsByCategoriesSuccess extends CategoriesState {}

class GetProductsByCategoriesError extends CategoriesState {
  final String error;
  GetProductsByCategoriesError({required this.error});
}
