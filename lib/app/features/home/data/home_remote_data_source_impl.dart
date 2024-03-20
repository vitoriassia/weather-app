import 'package:weather_app/app/core/services/api/errors/exception_handler_scope.dart';
import 'package:weather_app/app/core/services/api/response/data_wrapper_response.dart';
import 'package:weather_app/app/core/services/api_service.dart';
import 'package:weather_app/app/features/home/domain/datasources/home_remote_data_source.dart';
import 'package:weather_app/app/features/home/domain/entities/weather_entity.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<WeatherEntity> getWeather(Map<String, dynamic> payload) {
    return remoteDataSourceExceptionHandlerScope(
      () async {
        final response = await _apiService.getDataFrom(
          '/weather',
          queryParams: payload,
        );

        final data = DataWrapperResponse.fromJson(response);

        return WeatherEntity.fromMap(data.result);
      },
    );
  }

  @override
  Future<List<WeatherEntity>> getForecast(Map<String, dynamic> payload) {
    return remoteDataSourceExceptionHandlerScope(
      () async {
        final response = await _apiService.getDataFrom(
          '/forecast',
          queryParams: payload,
        );

        final data = DataWrapperResponse.fromJson(response);

        final listOnlyWeek = _getOneDayForWeek(data.result['list']);

        return List<WeatherEntity>.from(
          listOnlyWeek.map((e) => WeatherEntity.fromMap(e)),
        );
      },
    );
  }

  List<dynamic> _getOneDayForWeek(list) {
    Map<int, dynamic> daysData = {};

    for (var item in list) {
      DateTime date = DateTime.parse(item['dt_txt']);

      int dayOfWeek = date.weekday;

      if (!daysData.containsKey(dayOfWeek)) {
        daysData[dayOfWeek] = item;
      }
    }
    return daysData.values.toList();
  }
}
