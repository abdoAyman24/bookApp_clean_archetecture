import 'package:bloc/bloc.dart';
import 'package:book_app_clean_archetecture/Features/home/domain/Entities/entities.dart';
import 'package:book_app_clean_archetecture/Features/home/domain/use_case/featch_newse_books_usecase.dart';

part 'featch_news_books_state.dart';

class FeatchNewsBooksCubit extends Cubit<FeatchNewsBooksState> {
  FeatchNewsBooksCubit(this.featchNewsebooksusecase)
    : super(FeatchNewsBooksInitial());
  final FeatchNewsebooksusecase featchNewsebooksusecase;

  Future<void> featchNewsBooks({int pageNumber = 0}) async {
    if(pageNumber == 0) {
        emit(FeatchNewsBooksLoad());
     
    } else {
     emit(FeatchNewsBooksLoadPagination());
    }
   

    var result = await featchNewsebooksusecase.call(pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 0) {
           emit(FeatchNewsBooksFailure(failure.errorMessage));
         
        } else {
          emit(FeatchNewsBooksFailurePagination(failure.errorMessage));
        }
         emit(FeatchNewsBooksFailure(failure.errorMessage));
      },
      (books) {
        emit(FeatchNewsBooksSucess(books));
      },
    );
  }
}
