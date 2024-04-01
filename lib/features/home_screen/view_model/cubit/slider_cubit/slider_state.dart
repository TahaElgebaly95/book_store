class SliderState {}

class SliderInitial extends SliderState {}

class SliderLoading extends SliderState {}

class SliderSuccess extends SliderState {}

class SliderError extends SliderState {
  final String error;
  SliderError(this.error);
}
