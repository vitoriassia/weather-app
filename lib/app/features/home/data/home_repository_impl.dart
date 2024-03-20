import 'package:dartz/dartz.dart';
import 'package:weather_app/app/core/services/api/errors/exception_handler_scope.dart';
import 'package:weather_app/app/core/services/api/errors/failures.dart';
import 'package:weather_app/app/core/storage/main_cities/adapters/main_city_box/main_city_box.dart';
import 'package:weather_app/app/features/home/domain/datasources/home_local_data_source.dart';
import 'package:weather_app/app/features/home/domain/datasources/home_remote_data_source.dart';
import 'package:weather_app/app/features/home/domain/entities/main_city_entity.dart';
import 'package:weather_app/app/features/home/domain/entities/request/get_weather_from_lat_long_payload.dart';
import 'package:weather_app/app/features/home/domain/entities/weather_entity.dart';
import 'package:weather_app/app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;
  final HomeLocalDataSource _localDataSource;
  HomeRepositoryImpl(this._remoteDataSource, this._localDataSource);

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

  @override
  Future<void> persistListCurrentWeather(List<MainCityEntity> list) async {
    _localDataSource.persistMainCitiesCurrentWeather(
      List<MainCityBox>.from(
        list.map((e) => e.toBox()),
      ),
    );
  }

  @override
  Future<void> persistListForecast(List<MainCityEntity> list) async {
    _localDataSource.persistMainCitiesForecast(
      List<MainCityBox>.from(
        list.map((e) => e.toBox()),
      ),
    );
  }

  @override
  Future<List<MainCityEntity>> getCurrentWeatherLocal() async {
    final List<MainCityBox> listCities = await _localDataSource.getListCities();
    final List<MainCityEntity> listEntity = [];

    for (var item in listCities) {
      if (item.currentWeather != null) {
        listEntity.add(item.toEntity());
      }
    }

    return listEntity;
  }

  @override
  Future<List<MainCityEntity>> getForecastLocal() async {
    final List<MainCityBox> listCities = await _localDataSource.getListCities();
    final List<MainCityEntity> listEntity = [];

    for (var item in listCities) {
      if (item.forecast != null) {
        listEntity.add(item.toEntity());
      }
    }

    return listEntity;
  }
}
