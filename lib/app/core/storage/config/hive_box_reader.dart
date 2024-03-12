import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveBoxReader<B> {
  Box<B> get box;

  Future initializeBox();

  List<B> getAll() {
    return box.values.map((e) => e).toList();
  }

  B? get(String key) {
    return box.get(key, defaultValue: null);
  }

  Future<void> close() async => await box.close();
}
