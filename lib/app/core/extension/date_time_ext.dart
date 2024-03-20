import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  String get convertToSimpleDate {
    // ---- 7/10/1996 ----//
    if (this != null) {
      return DateFormat.yMd().add_Hm().format(this!).toString();
    }
    return '';
  }

  String? getAbrMonth() =>
      (this != null) ? DateFormat.E('en_US').format(this!) : null;
}
