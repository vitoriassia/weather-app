import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pokedex_app/app/core/design/images/app_images.dart';

class CustomPokemonImage extends StatelessWidget {
  final EdgeInsets padding;
  final bool useHero;
  final Size size;
  final String? imagePath;
  final ImageProvider placeholder = AppImages.bulbasaur;
  final Color? tintColor;

  const CustomPokemonImage({
    Key? key,
    required this.size,
    this.padding = EdgeInsets.zero,
    this.useHero = true,
    this.tintColor,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutQuint,
      padding: padding,
      child: imagePath == null
          ? Image(
              image: placeholder,
              width: size.width,
              height: size.height,
              color: Colors.black12,
            )
          : Image.file(
              File(imagePath!),
              width: size.width,
              height: size.height,
            ),
    );
  }
}
