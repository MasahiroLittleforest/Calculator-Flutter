import 'package:flutter/material.dart';

class NeumorphicEmbossContainer extends StatelessWidget {
  final double width;
  final double height;
  final double bevel;
  final Color color;
  final double radius;
  final Widget child;

  NeumorphicEmbossContainer({
    this.width,
    this.height,
    this.bevel = 10.0,
    this.color,
    this.radius = 10.0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final Color _color = color == null ? Colors.blueGrey[50] : color;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            offset: Offset(bevel / 4, bevel / 4),
            color: Colors.white,
            blurRadius: bevel / 4,
          ),
          BoxShadow(
            offset: Offset(-bevel / 4, -bevel / 4),
            color: Colors.blueGrey[300],
            blurRadius: bevel / 4,
          ),
        ],
      ),
      child: child,
    );
  }
}
