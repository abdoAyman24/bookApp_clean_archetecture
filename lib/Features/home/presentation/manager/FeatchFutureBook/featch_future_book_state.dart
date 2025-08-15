part of 'featch_future_book_cubit.dart';

abstract class FeatchFutureBookState {}

class FeatchFutureBookInitial extends FeatchFutureBookState {}

class FeatchFutureBookLoad extends FeatchFutureBookState {}
class FeatchFutureBookLoadPaggination extends FeatchFutureBookState {}
class FeatchFutureBookFailurePaggination extends FeatchFutureBookState {
  final String errorMessage;

  FeatchFutureBookFailurePaggination({required this.errorMessage});
}



class FeatchFutureBookFailure extends FeatchFutureBookState {
  final String errorMessage;

  FeatchFutureBookFailure(this.errorMessage);
}

class FeatchFutureBookSuccess extends FeatchFutureBookState {
  final List<EntitiesBooks> books;

  FeatchFutureBookSuccess(this.books);
}
