import 'package:flutter/material.dart';
import 'package:pokedex_app/app/core/design/res/dimen.dart';

class CenteredProgressIndicator extends StatelessWidget {
  final Color? color;
  final double size;
  final double strokeWidth;

  const CenteredProgressIndicator({
    Key? key,
    this.color,
    this.size = 38,
    this.strokeWidth = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(PokedexDimen.small),
        width: size,
        height: size,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
