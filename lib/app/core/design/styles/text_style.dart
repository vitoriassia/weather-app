import 'package:flutter/material.dart';
import 'package:weather_app/app/core/design/res/dimen.dart';

abstract class AppTextStyle {
  static const _parent = TextStyle(
    fontFamily: 'CircularStd',
    fontSize: AppFontSize.regular,
    color: Colors.white,
  );

  static final body = _parent.copyWith(
    debugLabel: 'Body',
    fontSize: AppFontSize.xxLarge,
  );

  static final subtitle1 = _parent.copyWith(
    debugLabel: 'Sub title 1',
    fontSize: AppFontSize.xLarge,
    fontWeight: FontWeight.w400,
    color: Colors.grey[300],
    height: 1.4,
  );

  static final headline3 = _parent.copyWith(
    debugLabel: 'Headline 3',
    fontSize: AppFontSize.regular,
    fontWeight: FontWeight.bold,
  );

  static final headlineWhite3 = _parent.copyWith(
      debugLabel: 'Headline 3 White',
      fontSize: AppFontSize.regular,
      fontWeight: FontWeight.bold,
      color: Colors.white);

  static final bodyBold = _parent.copyWith(
    debugLabel: 'Body Bold',
    fontSize: AppFontSize.small,
    fontWeight: FontWeight.bold,
  );

  static final headline = _parent.copyWith(
    debugLabel: 'Headline',
    fontFamily: 'Default-Pokedex-Font',
    fontSize: AppFontSize.xxLarge,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );
  static final headlineWhite = _parent.copyWith(
    debugLabel: 'Headline White',
    fontFamily: 'Default-Pokedex-Font',
    fontSize: AppFontSize.headline,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    height: 1.4,
  );
  static final defaultButton = _parent.copyWith(
    debugLabel: 'Default button',
    fontFamily: 'Default-Pokedex-Font',
    fontSize: AppFontSize.regular,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
