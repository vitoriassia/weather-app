import 'package:flutter/material.dart';
import 'package:pokedex_app/app/core/design/res/app_colors.dart';
import 'package:pokedex_app/app/core/design/res/dimen.dart';

abstract class PokedexTextStyle {
  static const _parent = TextStyle(
    fontFamily: 'CircularStd',
    fontSize: PokedexFontSize.regular,
    color: AppColors.textColor,
  );

  static final body = _parent.copyWith(
    debugLabel: 'Body',
    fontSize: PokedexFontSize.small,
  );

  static final headline3 = _parent.copyWith(
    debugLabel: 'Headline 3',
    fontSize: PokedexFontSize.regular,
    fontWeight: FontWeight.bold,
  );

  static final headlineWhite3 = _parent.copyWith(
      debugLabel: 'Headline 3 White',
      fontSize: PokedexFontSize.regular,
      fontWeight: FontWeight.bold,
      color: Colors.white);

  static final bodyBold = _parent.copyWith(
    debugLabel: 'Body Bold',
    fontSize: PokedexFontSize.small,
    fontWeight: FontWeight.bold,
  );

  static final headline = _parent.copyWith(
    debugLabel: 'Headline',
    fontFamily: 'Default-Pokedex-Font',
    fontSize: PokedexFontSize.xxLarge,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );
  static final headlineWhite = _parent.copyWith(
    debugLabel: 'Headline White',
    fontFamily: 'Default-Pokedex-Font',
    fontSize: PokedexFontSize.xxLarge,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    height: 1.4,
  );
  static final defaultButton = _parent.copyWith(
    debugLabel: 'Default button',
    fontFamily: 'Default-Pokedex-Font',
    fontSize: PokedexFontSize.regular,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
