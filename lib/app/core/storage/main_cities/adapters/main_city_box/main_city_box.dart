import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/app/core/storage/config/storage_binds.dart';
import 'package:weather_app/app/core/storage/main_cities/adapters/lat_long_box/lat_long_box.dart';
import 'package:weather_app/app/core/storage/main_cities/adapters/weather_box/weather_box.dart';
import 'package:weather_app/app/features/home/domain/entities/main_city_entity.dart';
import 'package:weather_app/app/features/home/domain/entities/weather_entity.dart';
part 'main_city_box.g.dart';

@HiveType(typeId: StorageBinds.mainCityId)
class MainCityBox {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final LatLongBox latLngEntity;

  @HiveField(2)
  final WeatherBox? currentWeather;

  @HiveField(3)
  final List<WeatherBox>? forecast;

  @HiveField(4)
  final String identifier;

  MainCityBox({
    required this.name,
    required this.latLngEntity,
    required this.currentWeather,
    required this.forecast,
    required this.identifier,
  });

  MainCityEntity toEntity() => MainCityEntity(
        name: name,
        latLngEntity: latLngEntity.toEntity(),
        currentWeather: currentWeather?.toEntity(),
        forecast: forecast != null
            ? List<WeatherEntity>.from(
                forecast!.map((e) => e.toEntity()).toList(),
              )
            : null,
      );
}
