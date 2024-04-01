class NewANewArrivalState {}

class NewArrivalInitial extends NewANewArrivalState {}

class NewArrivalLoading extends NewANewArrivalState {}

class NewArrivalSuccess extends NewANewArrivalState {}

class NewArrivalError extends NewANewArrivalState {
  final String error;
  NewArrivalError(this.error);
}
