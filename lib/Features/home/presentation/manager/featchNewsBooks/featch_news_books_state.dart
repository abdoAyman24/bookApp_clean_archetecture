part of 'featch_news_books_cubit.dart';

abstract class FeatchNewsBooksState {}

class FeatchNewsBooksInitial extends FeatchNewsBooksState {}

class FeatchNewsBooksLoad extends FeatchNewsBooksState {}
class FeatchNewsBooksLoadPagination extends FeatchNewsBooksState {}


class FeatchNewsBooksFailure extends FeatchNewsBooksState {
  final String errorMessage;

  FeatchNewsBooksFailure(this.errorMessage);
}
class FeatchNewsBooksFailurePagination extends FeatchNewsBooksState {
  final String errorMessage;

  FeatchNewsBooksFailurePagination(this.errorMessage);
}

class FeatchNewsBooksSucess extends FeatchNewsBooksState {
  final List<EntitiesBooks> books;

  FeatchNewsBooksSucess(this.books); 
}
