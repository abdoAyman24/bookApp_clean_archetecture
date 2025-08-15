import 'package:bloc/bloc.dart';
import 'package:book_app_clean_archetecture/Features/home/domain/Entities/entities.dart';
import 'package:book_app_clean_archetecture/Features/home/domain/use_case/featch_future_Books_Use_Case.dart';

part 'featch_future_book_state.dart';

class FeatchFutureBookCubit extends Cubit<FeatchFutureBookState> {
  FeatchFutureBookCubit(this.featchFuturebooksusecase)
      : super(FeatchFutureBookInitial());
  final FeatchFuturebooksusecase featchFuturebooksusecase;

  Future<void> featchFutureBooks({int pageNumber = 0 }) async {
    if(pageNumber == 0) {
      emit(FeatchFutureBookLoad());
    } else {
      emit(FeatchFutureBookLoadPaggination());
    }
    var books = await featchFuturebooksusecase.call(pageNumber);
    books.fold((failure) {
      if(pageNumber == 0) {
        emit(FeatchFutureBookFailure(failure.errorMessage));
      } else {
        emit(FeatchFutureBookFailurePaggination(errorMessage: failure.errorMessage));
      }
      emit(FeatchFutureBookFailure(failure.errorMessage));
    }, (books) {
      emit(FeatchFutureBookSuccess(books));
    });
  }
}
