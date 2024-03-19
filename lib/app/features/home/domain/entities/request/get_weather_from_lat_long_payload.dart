import 'package:equatable/equatable.dart';
import 'package:weather_app/app/core/shared/domain/entities/lat_lng_entity.dart';
import 'package:weather_app/app/features/home/domain/enums/units_temp_measurement.dart';

class GetWeatherFromLatLongPayload extends Equatable {
  final LatLngEntity latLngEntity;
  final UnitsTempMeasurement unitsTempMeasurement;

  const GetWeatherFromLatLongPayload({
    required this.latLngEntity,
    required this.unitsTempMeasurement,
  });

  @override
  String toString() {
    return 'GetWeatherFromLatLongPayload{ latLngEntity: $latLngEntity, unitsTempMeasurement: $unitsTempMeasurement,}';
  }

  Map<String, dynamic> toMap() => {
        'lat': latLngEntity.latitude,
        'lon': latLngEntity.longitude,
        'units': unitsTempMeasurement.toAPIKey,
      };

  @override
  List<Object?> get props => [
        latLngEntity,
        unitsTempMeasurement,
      ];
}
