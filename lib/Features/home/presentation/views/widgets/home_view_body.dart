import 'package:book_app_clean_archetecture/Features/home/presentation/views/widgets/featch_future_books_bloc_builder.dart';
import 'package:book_app_clean_archetecture/Features/home/presentation/views/widgets/news_books_list_view_bloc_consumer.dart';
import 'package:book_app_clean_archetecture/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: CustomAppBar()),
              featchFutureBooksBlocBuilder(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'News Books',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
         SliverFillRemaining(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30),
            child: newsBooksListViewBlocConsumer(),
          ),
        ),
      ],
    );
  }
}




