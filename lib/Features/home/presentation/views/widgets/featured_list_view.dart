import 'package:book_app_clean_archetecture/Features/home/domain/Entities/entities.dart';
import 'package:book_app_clean_archetecture/Features/home/presentation/manager/FeatchFutureBook/featch_future_book_cubit.dart';
import 'package:book_app_clean_archetecture/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({Key? key, required this.books}) : super(key: key);

  final List<EntitiesBooks> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
 late final ScrollController _scrollController;
  int nextPage= 0;
   bool isLoading = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    

    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.position.pixels;

        
        if (currentScroll >= maxScroll * 0.7) {
         
          if(!isLoading){
            isLoading = true;
            context.read<FeatchFutureBookCubit>().featchFutureBooks(pageNumber: nextPage++ );
            isLoading = false;
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: InkWell(
              onTap: () {
                GoRouter.of(context).push(
                  AppRouter.kBookDetailsView,
                  extra: widget.books[index],
                );
              },
              child: CustomBookImage(
                imageUrl: widget.books[index].image ?? '',
              ),
            ),
          );
        },
      ),
    );
  }
}
