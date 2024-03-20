import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/app/core/storage/config/storage_binds.dart';
import 'package:weather_app/app/features/home/domain/entities/weather_entity.dart';
part 'weather_box.g.dart';

@HiveType(typeId: StorageBinds.weatherId)
class WeatherBox {
  @HiveField(0)
  final String icon;

  @HiveField(1)
  final String weather;

  @HiveField(2)
  final double temp;

  @HiveField(3)
  final double maxTemp;

  @HiveField(4)
  final double minTemp;

  @HiveField(5)
  final String? abrWeekDay;

  WeatherBox({
    required this.icon,
    required this.weather,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.abrWeekDay,
  });

  WeatherEntity toEntity() => WeatherEntity(
      icon: icon,
      weather: weather,
      temp: temp,
      maxTemp: maxTemp,
      minTemp: minTemp,
      abrWeekDay: abrWeekDay);
}
