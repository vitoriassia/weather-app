import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/app/core/services/api/errors/failures.dart';
import 'package:weather_app/app/core/shared/domain/use_case.dart';
import 'package:weather_app/app/features/home/domain/entities/main_city_entity.dart';
import 'package:weather_app/app/features/home/domain/entities/request/get_weather_from_lat_long_payload.dart';
import 'package:weather_app/app/features/home/domain/enums/units_temp_measurement.dart';
import 'package:weather_app/app/features/home/domain/repositories/home_repository.dart';

class GetListMainCitiesWithWeatherUseCase
    implements
        UseCase<GetListMainCitiesWithWeatherParams, List<MainCityEntity>> {
  final HomeRepository _repository;

  GetListMainCitiesWithWeatherUseCase(this._repository);

  @override
  Future<Either<Failure, List<MainCityEntity>>> call(
      GetListMainCitiesWithWeatherParams params) async {
    if (await hasConnection()) {
      return Right(await getRemoteMainCitiesWithWeather(params.mainCities));
    } else {
      return Right(await _repository.getCurrentWeatherLocal());
    }
  }

  Future<bool> hasConnection() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    return connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi);
  }

  Future<List<MainCityEntity>> getRemoteMainCitiesWithWeather(
      List<MainCityEntity> mainCities) async {
    List<MainCityEntity> listWeather = [];

    for (var city in mainCities) {
      final result =
          await _repository.getWeatherFromLatLong(toPayloadWeather(city));

      result.fold(
        (l) => null,
        (success) => listWeather.add(
          city.copyWith(currentWeather: success),
        ),
      );
    }

    _repository.persistListCurrentWeather(listWeather);

    return listWeather;
  }

  GetWeatherFromLatLongPayload toPayloadWeather(MainCityEntity city) =>
      GetWeatherFromLatLongPayload(
        latLngEntity: city.latLngEntity,
        unitsTempMeasurement: UnitsTempMeasurement.metric,
      );
}

class GetListMainCitiesWithWeatherParams extends Equatable {
  final List<MainCityEntity> mainCities;
  const GetListMainCitiesWithWeatherParams({
    required this.mainCities,
  });

  @override
  List<Object> get props => [mainCities];
}
