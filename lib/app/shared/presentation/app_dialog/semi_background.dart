import 'package:flutter/material.dart';

class SemiBackground extends StatelessWidget {
  final double height;
  final Color color;
  const SemiBackground({
    Key? key,
    required this.height,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: ClipPath(
        clipper: SemiBackgroundClipper(),
        child: Container(
          width: MediaQuery.of(context).size.width - 120,
          height: height,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
            color: color,
          ),
        ),
      ),
    );
  }
}

class SemiBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(0, size.height) // Add line p1p2
      ..lineTo(size.width, size.height) // Add line p2p3
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
