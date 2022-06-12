import 'package:flutter/material.dart';

class BorderBox extends StatelessWidget {
  final Widget child;
  final Color color;
  final EdgeInsets padding;
  final double width, height;

  const BorderBox(
      {Key? key,
      required this.padding,
      required this.width,
      required this.height,
      required this.child,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withAlpha(40), width: 2)),
      //padding: padding?? const EdgeInsets.all(8.0),
      child: Center(
        child: child,
      ),
    );
  }
}
