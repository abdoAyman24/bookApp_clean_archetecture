import 'package:book_app_clean_archetecture/Features/home/presentation/manager/featchNewsBooks/featch_news_books_cubit.dart';
import 'package:book_app_clean_archetecture/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class newsBooksListViewBlocConsumer extends StatelessWidget {
  const newsBooksListViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatchNewsBooksCubit, FeatchNewsBooksState>(
      listener: (context, state) {
       
      },
      builder: (context, state) {
       if(state is FeatchNewsBooksSucess){
        return BestSellerListView(books: state.books);
       } else if(state is FeatchNewsBooksFailure){
        return Center(
          child: Text(state.errorMessage),
        );
       } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
       }
      },
    );
  }
}