import 'package:hive/hive.dart';
import 'package:weather_app/app/core/storage/config/hive_box_reader.dart';
import 'package:weather_app/app/core/storage/config/storage_binds.dart';
import 'adapters/main_city_box/main_city_box.dart';

class MainCitiesReader extends HiveBoxReader<MainCityBox> {
  static MainCitiesReader? _instance;
  late final Box<MainCityBox> _box;
  static const _key = StorageBinds.mainCitKey;

  MainCitiesReader._();

  @override
  Box<MainCityBox> get box => _box;

  static MainCitiesReader getInstance() {
    _instance ??= MainCitiesReader._();
    return _instance!;
  }

  @override
  Future initializeBox() async {
    _box = Hive.isBoxOpen(_key)
        ? Hive.box(
            _key,
          )
        : await Hive.openBox(
            _key,
          );
  }
}
