import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final Widget child;
  final double height;
  final Color color;
  final double padding;
  final Alignment alignment;
  final EdgeInsetsGeometry stackPadding;
  final BorderRadiusGeometry? borderRadius;
  const AppDialog(
      {super.key,
      required this.child,
      required this.height,
      this.alignment = Alignment.center,
      this.color = Colors.white,
      this.borderRadius,
      this.stackPadding = const EdgeInsets.all(8.0),
      this.padding = 0});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: stackPadding,
      child: Stack(children: <Widget>[
        const Opacity(
          opacity: 1.0,
        ),
        Align(
          alignment: alignment,
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: SizedBox(
              height: height,
              width: double.infinity,
              child: Material(
                borderRadius: borderRadius ?? BorderRadius.circular(8),
                color: color,
                child: child,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
