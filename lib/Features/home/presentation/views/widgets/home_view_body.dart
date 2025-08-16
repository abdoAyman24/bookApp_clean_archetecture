import 'package:book_app_clean_archetecture/Features/home/presentation/manager/featchNewsBooks/featch_news_books_cubit.dart';
import 'package:book_app_clean_archetecture/Features/home/presentation/views/widgets/featch_future_books_bloc_builder.dart';
import 'package:book_app_clean_archetecture/Features/home/presentation/views/widgets/news_books_list_view_bloc_consumer.dart';
import 'package:book_app_clean_archetecture/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final ScrollController _scrollController = ScrollController();
  bool isLoadingMore = false;
  int nextPage = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final scrollPercentage = currentScroll / maxScroll;

    if (scrollPercentage >= 0.7 ) {
      // 🔹 استدعاء Cubit لجلب المزيد من الكتب
      context.read<FeatchNewsBooksCubit>().featchNewsBooks(
        pageNumber: nextPage++,
      );
      
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        const SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              featchFutureBooksBlocBuilder(),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text('News Books', style: Styles.textStyle18),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: newsBooksListViewBlocConsumer(),
          ),
        ),
      ],
    );
  }
}
