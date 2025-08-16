import 'package:book_app_clean_archetecture/Features/home/presentation/views/widgets/custom_book_image_loading_indecator.dart';
import 'package:book_app_clean_archetecture/core/widgets/custom_fading_idecator.dart';
import 'package:flutter/material.dart';

class futurBookListViewLoadingIndecator extends StatefulWidget {
  const futurBookListViewLoadingIndecator({super.key, required this.animation});
  final Animation<double> animation;

  @override
  State<futurBookListViewLoadingIndecator> createState() => _futurBookListViewLoadingIndecatorState();
}

class _futurBookListViewLoadingIndecatorState extends State<futurBookListViewLoadingIndecator> {
  @override
  Widget build(BuildContext context) {
    return  customFadingIndecator(
      animation: widget.animation,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child:CustomBookImageLoadingIndecator()
            );
          },
        ),
      ),
    );
  }
}