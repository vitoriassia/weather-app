import 'package:hive/hive.dart';
import 'package:weather_app/app/core/storage/config/hive_box_writer.dart';
import 'package:weather_app/app/core/storage/config/storage_binds.dart';
import 'dart:developer' as developer;

import 'adapters/main_city_box/main_city_box.dart';

class MainCitiesWriter extends HiveBoxWriter<MainCityBox> {
  static MainCitiesWriter? _instance;
  late final Box<MainCityBox> _box;
  static const _key = StorageBinds.mainCitKey;

  MainCitiesWriter._();

  @override
  Box<MainCityBox> get box => _box;

  static MainCitiesWriter getInstance() {
    _instance ??= MainCitiesWriter._();
    return _instance!;
  }

  @override
  Future initializeBox() async {
    _box = Hive.isBoxOpen(_key) ? Hive.box(_key) : await Hive.openBox(_key);
  }

  @override
  Future<void> put(MainCityBox adapter) async {
    developer.log(adapter.toString(), name: "INSERT/EDIT DATA:");

    await box.put(adapter.identifier, adapter);
  }

  Future<void> delete(id) async {
    await box.delete(id);
  }

  @override
  Future<void> putAll(List<MainCityBox> adapters) async {
    for (var adapter in adapters) {
      await put(adapter);
    }
  }
}
