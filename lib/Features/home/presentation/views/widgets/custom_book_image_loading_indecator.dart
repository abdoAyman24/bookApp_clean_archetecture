import 'package:flutter/material.dart';

class CustomBookImageLoadingIndecator extends StatelessWidget {
  const CustomBookImageLoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(color: Colors.grey[50]),
      ),
    );
  }
}
