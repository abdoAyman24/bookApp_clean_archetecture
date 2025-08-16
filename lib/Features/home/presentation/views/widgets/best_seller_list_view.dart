import 'package:book_app_clean_archetecture/Features/home/domain/Entities/entities.dart';
import 'package:flutter/material.dart';

import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key, required this.books});
   final List<EntitiesBooks> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return  Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(books: books[index],),
        );
      },
    );
  }
}
