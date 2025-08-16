import 'package:flutter/material.dart';

class customFadingIndecator extends StatefulWidget {
  const customFadingIndecator({super.key, this.child, required this.animation});
  final Widget? child;
  final Animation<double> animation;

  @override
  State<customFadingIndecator> createState() => _customFadingIndecatorState();
}

class _customFadingIndecatorState extends State<customFadingIndecator>{
  


  

  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: widget.animation.value, child: widget.child);
  }
}
