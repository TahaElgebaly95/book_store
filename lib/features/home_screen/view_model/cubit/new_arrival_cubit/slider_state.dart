class NewArrivalState {}

class NewArrivalInitial extends NewArrivalState {}

class NewArrivalLoading extends NewArrivalState {}

class NewArrivalSuccess extends NewArrivalState {}

class NewArrivalError extends NewArrivalState {
  final String error;
  NewArrivalError(this.error);
}
