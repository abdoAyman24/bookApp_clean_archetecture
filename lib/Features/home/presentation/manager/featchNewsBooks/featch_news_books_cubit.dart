import 'package:bloc/bloc.dart';
import 'package:book_app_clean_archetecture/Features/home/domain/Entities/entities.dart';
import 'package:book_app_clean_archetecture/Features/home/domain/use_case/featch_newse_books_usecase.dart';


part 'featch_news_books_state.dart';

class FeatchNewsBooksCubit extends Cubit<FeatchNewsBooksState> {
  FeatchNewsBooksCubit(this.featchNewsebooksusecase)
      : super(FeatchNewsBooksInitial());
  final FeatchNewsebooksusecase featchNewsebooksusecase;

  Future<void> feachNewsBooks() async {
    emit(FeatchNewsBooksLoad());

    var result = await featchNewsebooksusecase.call();
    result.fold((failure) {
      emit(FeatchNewsBooksFailure(failure.errorMessage));
    }, (books) {
      emit(FeatchNewsBooksSucess(books));
    });
  }
}
