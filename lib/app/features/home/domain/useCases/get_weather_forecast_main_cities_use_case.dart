import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/app/core/services/api/errors/failures.dart';
import 'package:weather_app/app/core/shared/domain/use_case.dart';
import 'package:weather_app/app/features/home/domain/entities/main_city_entity.dart';
import 'package:weather_app/app/features/home/domain/entities/request/get_weather_from_lat_long_payload.dart';
import 'package:weather_app/app/features/home/domain/enums/units_temp_measurement.dart';
import 'package:weather_app/app/features/home/domain/repositories/home_repository.dart';

class GetWeatherForecastMainCitiesUseCase
    implements
        UseCase<GetWeatherForecastMainCitiesParams, List<MainCityEntity>> {
  final HomeRepository _repository;

  GetWeatherForecastMainCitiesUseCase(this._repository);

  @override
  Future<Either<Failure, List<MainCityEntity>>> call(
      GetWeatherForecastMainCitiesParams params) async {
    if (await hasConnection()) {
      return Right(
          await getRemoteMainCitiesWithWeatherForecast(params.mainCities));
    } else {
      return Right(await _repository.getForecastLocal());
    }
  }

  Future<bool> hasConnection() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    return connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi);
  }

  Future<List<MainCityEntity>> getRemoteMainCitiesWithWeatherForecast(
      List<MainCityEntity> mainCities) async {
    List<MainCityEntity> listWeather = [];

    for (var city in mainCities) {
      final result = await _repository.getForecast(toPayloadWeather(city));

      result.fold(
        (l) => null,
        (success) => listWeather.add(
          city.copyWith(forecast: success),
        ),
      );
    }

    _repository.persistListForecast(listWeather);

    return listWeather;
  }

  GetWeatherFromLatLongPayload toPayloadWeather(MainCityEntity city) =>
      GetWeatherFromLatLongPayload(
        latLngEntity: city.latLngEntity,
        unitsTempMeasurement: UnitsTempMeasurement.metric,
      );
}

class GetWeatherForecastMainCitiesParams extends Equatable {
  final List<MainCityEntity> mainCities;
  const GetWeatherForecastMainCitiesParams({
    required this.mainCities,
  });

  @override
  List<Object> get props => [mainCities];
}
