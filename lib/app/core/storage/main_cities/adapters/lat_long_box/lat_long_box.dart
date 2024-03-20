import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/app/core/shared/domain/entities/lat_lng_entity.dart';
import 'package:weather_app/app/core/storage/config/storage_binds.dart';
part 'lat_long_box.g.dart';

@HiveType(typeId: StorageBinds.latLngId)
class LatLongBox {
  @HiveField(0)
  final double latitude;

  @HiveField(1)
  final double longitude;

  LatLongBox({
    required this.latitude,
    required this.longitude,
  });

  LatLngEntity toEntity() =>
      LatLngEntity(latitude: latitude, longitude: longitude);
}
