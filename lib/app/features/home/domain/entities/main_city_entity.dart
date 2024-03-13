import 'package:equatable/equatable.dart';
import 'package:weather_app/app/core/shared/domain/entities/lat_lng_entity.dart';
import 'package:weather_app/app/features/home/domain/entities/weather_entity.dart';

class MainCityEntity extends Equatable {
  final String name;
  final LatLngEntity latLngEntity;
  final WeatherEntity? weatherEntity;

  const MainCityEntity({
    required this.name,
    required this.latLngEntity,
    this.weatherEntity,
  });

  MainCityEntity copyWith({
    String? name,
    LatLngEntity? latLngEntity,
    WeatherEntity? weatherEntity,
  }) {
    return MainCityEntity(
      name: name ?? this.name,
      latLngEntity: latLngEntity ?? this.latLngEntity,
      weatherEntity: weatherEntity ?? this.weatherEntity,
    );
  }

  @override
  List<Object?> get props => [
        name,
        latLngEntity,
        weatherEntity,
      ];
}
