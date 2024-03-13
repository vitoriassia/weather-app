import 'package:dartz/dartz.dart';
import 'package:weather_app/app/core/services/api/errors/failures.dart';
import 'package:weather_app/app/features/home/domain/entities/request/get_weather_from_lat_long_payload.dart';
import 'package:weather_app/app/features/home/domain/entities/weather_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, WeatherEntity>> getWeatherFromLatLong(
      GetWeatherFromLatLongPayload payload);
}
