import 'package:hive_flutter/adapters.dart';
import '../main_cities/adapters/lat_long_box/lat_long_box.dart';
import '../main_cities/adapters/main_city_box/main_city_box.dart';
import '../main_cities/adapters/weather_box/weather_box.dart';

abstract class HiveInitializer {
  static call() async {
    Hive.registerAdapter(LatLongBoxAdapter());
    Hive.registerAdapter(WeatherBoxAdapter());
    Hive.registerAdapter(MainCityBoxAdapter());

    await Hive.initFlutter();
  }
}
