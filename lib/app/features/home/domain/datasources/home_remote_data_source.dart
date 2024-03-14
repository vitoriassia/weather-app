import 'package:weather_app/app/features/home/domain/entities/weather_entity.dart';

abstract class HomeRemoteDataSource {
  Future<WeatherEntity> getWeather(Map<String, dynamic> payload);
  Future<List<WeatherEntity>> getForecast(Map<String, dynamic> payload);
}
