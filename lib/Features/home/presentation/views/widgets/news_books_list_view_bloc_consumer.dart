import 'package:book_app_clean_archetecture/Features/home/domain/Entities/entities.dart';
import 'package:book_app_clean_archetecture/Features/home/presentation/manager/featchNewsBooks/featch_news_books_cubit.dart';
import 'package:book_app_clean_archetecture/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class NewsBooksListViewBlocConsumer extends StatelessWidget {
  NewsBooksListViewBlocConsumer({super.key});
  List<EntitiesBooks> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatchNewsBooksCubit, FeatchNewsBooksState>(
      listener: (context, state) {
        if (state is FeatchNewsBooksSucess) {
          books.addAll(state.books);
        }
        if (state is FeatchNewsBooksFailurePagination) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is FeatchNewsBooksSucess ||
            state is FeatchNewsBooksLoadPagination ||
            state is FeatchNewsBooksFailurePagination) {
          return BestSellerListView(books: books);
        } else if (state is FeatchNewsBooksFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
