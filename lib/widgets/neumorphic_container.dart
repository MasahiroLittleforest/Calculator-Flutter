import 'package:flutter/material.dart';

class NeumorphicContainer extends StatelessWidget {
  NeumorphicContainer({
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(10),
    this.bevel = 10.0,
    this.color,
    this.boxShadowColors,
    this.radius = 10.0,
    this.child,
  }) : offset = Offset(bevel / 3, bevel / 3);

  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final double bevel;
  final Offset offset;
  final Color? color;
  final List<Color>? boxShadowColors;
  final double radius;
  final Widget? child;

  List<BoxShadow> getBoxShadows({required BuildContext context}) {
    final Brightness _brightness = Theme.of(context).brightness;
    if (_brightness == Brightness.light) {
      return [
        BoxShadow(
          offset: -offset,
          color: boxShadowColors?.first ?? Colors.white,
          blurRadius: bevel / 3,
        ),
        BoxShadow(
          offset: offset,
          color: boxShadowColors?.last ?? Colors.blueGrey[100]!,
          blurRadius: bevel / 3,
        ),
      ];
    } else {
      return [
        BoxShadow(
          offset: -offset,
          color: boxShadowColors?.first ?? Colors.grey[850]!,
          blurRadius: bevel / 3,
        ),
        BoxShadow(
          offset: offset,
          color: boxShadowColors?.last ?? Colors.black,
          blurRadius: bevel / 3,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: getBoxShadows(context: context),
      ),
      child: child,
    );
  }
}
