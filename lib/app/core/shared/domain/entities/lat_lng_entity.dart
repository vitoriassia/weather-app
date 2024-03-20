import 'package:equatable/equatable.dart';
import 'package:weather_app/app/core/storage/main_cities/adapters/lat_long_box/lat_long_box.dart';

class LatLngEntity extends Equatable {
  final double latitude;
  final double longitude;
  const LatLngEntity({
    required this.latitude,
    required this.longitude,
  });

  LatLongBox toBox() => LatLongBox(latitude: latitude, longitude: longitude);

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}
