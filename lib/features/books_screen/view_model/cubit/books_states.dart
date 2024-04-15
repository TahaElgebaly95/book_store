class BooksStates {}

class InitialBooksStates extends BooksStates {}

class LoadingBooksStates extends BooksStates {}

class SuccessBooksStates extends BooksStates {}

class ErrorBooksStates extends BooksStates {
  final String error;
  ErrorBooksStates(this.error);
}