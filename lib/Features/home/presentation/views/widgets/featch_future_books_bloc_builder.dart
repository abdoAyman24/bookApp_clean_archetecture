import 'package:book_app_clean_archetecture/Features/home/domain/Entities/entities.dart';
import 'package:book_app_clean_archetecture/Features/home/presentation/manager/FeatchFutureBook/featch_future_book_cubit.dart';
import 'package:book_app_clean_archetecture/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:book_app_clean_archetecture/Features/home/presentation/views/widgets/future_book_list_view_loading_indecator.dart';
import 'package:book_app_clean_archetecture/core/utils/function/build_error_snac_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class featchFutureBooksBlocBuilder extends StatefulWidget {
  const featchFutureBooksBlocBuilder({super.key});

  @override
  State<featchFutureBooksBlocBuilder> createState() =>
      _featchFutureBooksBlocBuilderState();
}

class _featchFutureBooksBlocBuilderState
    extends State<featchFutureBooksBlocBuilder> {
  final List<EntitiesBooks> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatchFutureBookCubit, FeatchFutureBookState>(
      listener: (context, state) {
        if (state is FeatchFutureBookSuccess) {
          books.addAll(state.books);
        }
        if (state is FeatchFutureBookFailurePaggination) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(buildErrorSnacBar(state.errorMessage));
        }
      },
      builder: (context, state) {
        
        if (state is FeatchFutureBookSuccess ||
            state is FeatchFutureBookLoadPaggination ||
            state is FeatchFutureBookFailurePaggination) {
          return FeaturedBooksListView(books: books);
        } else if (state is FeatchFutureBookFailure) {
          return Text(state.errorMessage);
        } else {
         return futurBookListViewLoadingIndecator();
        }
      },
    );
  }
}
