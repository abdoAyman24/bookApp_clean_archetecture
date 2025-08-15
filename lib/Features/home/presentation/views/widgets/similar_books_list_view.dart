import 'package:book_app_clean_archetecture/Features/home/domain/Entities/entities.dart';

import 'package:flutter/material.dart';

import 'custom_book_item.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key, required this.books});
  final List<EntitiesBooks> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return  Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: CustomBookImage(imageUrl: books[index].image?? '',),
            );
          }),
    );
  }
}
