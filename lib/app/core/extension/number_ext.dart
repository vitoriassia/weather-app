import 'dart:math';

extension IntExtension on int {
  DateTime get dateTimeFromTimeStamp =>
      DateTime.fromMillisecondsSinceEpoch(this * 1000).toLocal();
}

extension NumberExt on double {
  String get toBrazilianPercent {
    return '${(this * 100).roundDouble(2)}%';
  }

  double roundDouble(int places) {
    num mod = pow(10.0, places);
    return ((this * mod).round().toDouble() / mod);
  }
}
