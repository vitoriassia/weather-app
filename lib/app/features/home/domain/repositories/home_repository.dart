import 'package:dartz/dartz.dart';
import 'package:weather_app/app/core/services/api/errors/failures.dart';
import 'package:weather_app/app/features/home/domain/entities/main_city_entity.dart';
import 'package:weather_app/app/features/home/domain/entities/request/get_weather_from_lat_long_payload.dart';
import 'package:weather_app/app/features/home/domain/entities/weather_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, WeatherEntity>> getWeatherFromLatLong(
      GetWeatherFromLatLongPayload payload);

  Future<Either<Failure, List<WeatherEntity>>> getForecast(
      GetWeatherFromLatLongPayload payload);

  Future<void> persistListCurrentWeather(List<MainCityEntity> list);

  Future<void> persistListForecast(List<MainCityEntity> list);

  Future<List<MainCityEntity>> getCurrentWeatherLocal();

  Future<List<MainCityEntity>> getForecastLocal();
}
