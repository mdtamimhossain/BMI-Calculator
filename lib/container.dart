import 'package:flutter/material.dart';

class containerBox extends StatelessWidget {
  const containerBox({required this.childWidget, required this.boxColor});
  final Widget? childWidget;
  final Color boxColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: boxColor,
      ),
    );
  }
}
