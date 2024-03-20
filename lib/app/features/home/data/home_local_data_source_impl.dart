import 'package:weather_app/app/core/services/api/errors/exception_handler_scope.dart';
import 'package:weather_app/app/core/storage/main_cities/adapters/main_city_box/main_city_box.dart';
import 'package:weather_app/app/core/storage/main_cities/main_cities_reader.dart';
import 'package:weather_app/app/core/storage/main_cities/main_cities_writer.dart';
import 'package:weather_app/app/features/home/domain/datasources/home_local_data_source.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  final MainCitiesWriter _writer;
  final MainCitiesReader _reader;

  HomeLocalDataSourceImpl(this._writer, this._reader);

  @override
  Future<List<MainCityBox>> getListCities() {
    return localDataSourceExceptionHandlerScope(
      () => _reader.getAll(),
    );
  }

  @override
  Future<void> persistMainCitiesForecast(List<MainCityBox> box) {
    return localDataSourceExceptionHandlerScope(() {
      _deleteAllMainCitiesForecast();
      _writer.putAll(box);
    });
  }

  @override
  Future<void> persistMainCitiesCurrentWeather(List<MainCityBox> box) async {
    return localDataSourceExceptionHandlerScope(() {
      _deleteAllMainCitiesCurrentWeather();
      _writer.putAll(box);
    });
  }

  void _deleteAllMainCitiesCurrentWeather() {
    final List<MainCityBox> allList = _reader.getAll();

    for (var item in allList) {
      if (item.currentWeather != null) {
        _writer.delete(item.identifier);
      }
    }
  }

  void _deleteAllMainCitiesForecast() {
    final List<MainCityBox> allList = _reader.getAll();

    for (var item in allList) {
      if (item.forecast != null) {
        _writer.delete(item.identifier);
      }
    }
  }
}
