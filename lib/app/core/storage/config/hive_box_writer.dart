import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveBoxWriter<B> {
  Box<B> get box;

  Future initializeBox();

  Future<void> put(B adapter);

  Future<void> putAll(List<B> adapters);

  Future<int> clear() async => await box.clear();

  Future<void> close() async => await box.close();

  Future<void> deleteFromDisk() async => await box.deleteFromDisk();
}
