import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import 'package:weather_app/app/core/shared/domain/entities/lat_lng_entity.dart';
import 'package:weather_app/app/core/storage/main_cities/adapters/main_city_box/main_city_box.dart';
import 'package:weather_app/app/core/storage/main_cities/adapters/weather_box/weather_box.dart';
import 'package:weather_app/app/features/home/domain/entities/weather_entity.dart';

class MainCityEntity extends Equatable {
  final String name;
  final LatLngEntity latLngEntity;
  final WeatherEntity? currentWeather;
  final List<WeatherEntity>? forecast;

  const MainCityEntity({
    required this.name,
    required this.latLngEntity,
    this.currentWeather,
    this.forecast,
  });

  MainCityEntity copyWith({
    String? name,
    LatLngEntity? latLngEntity,
    WeatherEntity? currentWeather,
    List<WeatherEntity>? forecast,
  }) {
    return MainCityEntity(
      name: name ?? this.name,
      latLngEntity: latLngEntity ?? this.latLngEntity,
      currentWeather: currentWeather ?? this.currentWeather,
      forecast: forecast ?? this.forecast,
    );
  }

  MainCityBox toBox() => MainCityBox(
        name: name,
        latLngEntity: latLngEntity.toBox(),
        currentWeather: currentWeather?.toBox(),
        forecast: forecast != null
            ? List<WeatherBox>.from(forecast!.map((e) => e.toBox()))
            : null,
        identifier: const Uuid().v1(),
      );

  @override
  List<Object?> get props => [
        name,
        latLngEntity,
        currentWeather,
        forecast,
      ];
}
