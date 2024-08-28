class OrderState {}

class OrderInitialState extends OrderState {}

class CheckoutLoadingState extends OrderState {}

class CheckoutSuccessState extends OrderState {}

class CheckoutErrorState extends OrderState {}

class PlaceOrderLoadingState extends OrderState {}

class PlaceOrderSuccessState extends OrderState {}

class PlaceOrderErrorState extends OrderState {}

class OrderHistoryLoadingState extends OrderState {}

class OrderHistorySuccessState extends OrderState {}

class OrderHistoryErrorState extends OrderState {}

class ShowSingleOrderLoadingState extends OrderState {}

class ShowSingleOrderSuccessState extends OrderState {}

class ShowSingleOrderErrorState extends OrderState {}

final class GovernoratesInitial extends OrderState {}

final class GovernoratesLoading extends OrderState {}

final class GovernoratesSuccess extends OrderState {}

final class GovernoratesError extends OrderState {}

final class ChangeGovernorate extends OrderState {}


