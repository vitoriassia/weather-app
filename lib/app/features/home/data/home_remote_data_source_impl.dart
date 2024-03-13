import 'package:weather_app/app/core/services/api/errors/exception_handler_scope.dart';
import 'package:weather_app/app/core/services/api/response/data_wrapper_response.dart';
import 'package:weather_app/app/core/services/api_service.dart';
import 'package:weather_app/app/features/home/domain/datasources/home_remote_data_source.dart';
import 'package:weather_app/app/features/home/domain/entities/weather_entity.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<WeatherEntity> getWeatherFromLatLong(Map<String, dynamic> payload) {
    return remoteDataSourceExceptionHandlerScope(
      () async {
        final response = await _apiService.getDataFrom(
          '/weather',
          queryParams: payload,
        );

        final data = DataWrapperResponse.fromJson(
            response.data['results'], response.statusCode);

        return WeatherEntity.fromMap(data.result);
      },
    );
  }
}
