import 'package:flutter/material.dart';

const String _imagePath = 'assets/images';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  static const appLogo = _Image('app_logo.png');
  static const midRain = _Image(
    'weather_icons/default.png',
  );
}
