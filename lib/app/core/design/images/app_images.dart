import 'package:flutter/material.dart';

const String _imagePath = 'assets/images';
const String _iconsPath = 'weather_icons/';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  static const appLogo = _Image('app_logo.png');

  static weatherIcon(String iconId) => _Image('$_iconsPath$iconId.png');
}
