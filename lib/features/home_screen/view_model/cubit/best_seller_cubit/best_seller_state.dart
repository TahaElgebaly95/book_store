class BestSellerState {}

class BestSellerInitial extends BestSellerState {}

class BestSellerLoading extends BestSellerState {}

class BestSellerSuccess extends BestSellerState {}

class BestSellerError extends BestSellerState {
  final String error;
  BestSellerError(this.error);
}
