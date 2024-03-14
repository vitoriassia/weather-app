import 'package:dartz/dartz.dart';
import 'package:weather_app/app/core/services/api/errors/exception_handler_scope.dart';
import 'package:weather_app/app/core/services/api/errors/failures.dart';
import 'package:weather_app/app/features/home/domain/datasources/home_remote_data_source.dart';
import 'package:weather_app/app/features/home/domain/entities/request/get_weather_from_lat_long_payload.dart';
import 'package:weather_app/app/features/home/domain/entities/weather_entity.dart';
import 'package:weather_app/app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, WeatherEntity>> getWeatherFromLatLong(
      GetWeatherFromLatLongPayload payload) {
    return repositoryExceptionHandlerScope<WeatherEntity>(
      () async => await _remoteDataSource.getWeather(payload.toMap()),
    );
  }

  @override
  Future<Either<Failure, List<WeatherEntity>>> getForecast(
      GetWeatherFromLatLongPayload payload) {
    return repositoryExceptionHandlerScope<List<WeatherEntity>>(
      () async => await _remoteDataSource.getForecast(payload.toMap()),
    );
  }
}
