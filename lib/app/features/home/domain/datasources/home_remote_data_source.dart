import 'package:weather_app/app/features/home/domain/entities/weather_entity.dart';

abstract class HomeRemoteDataSource {
  Future<WeatherEntity> getWeatherFromLatLong(Map<String, dynamic> payload);
}
