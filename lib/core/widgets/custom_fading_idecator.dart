import 'package:flutter/material.dart';

class customFadingIndecator extends StatefulWidget {
  const customFadingIndecator({super.key, this.child});
  final Widget? child;

  @override
  State<customFadingIndecator> createState() => _customFadingIndecatorState();
}

class _customFadingIndecatorState extends State<customFadingIndecator>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    animation = Tween(begin: 0.3, end: 0.8).animate(animationController);
    animationController.addListener((){setState(() {
      
    });});
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: animation.value,
    child: widget.child,);
  }
}
