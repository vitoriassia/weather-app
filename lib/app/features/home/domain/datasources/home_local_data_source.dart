import 'package:weather_app/app/core/storage/main_cities/adapters/main_city_box/main_city_box.dart';

abstract class HomeLocalDataSource {
  Future<List<MainCityBox>> getListCities();
  Future<void> persistMainCitiesCurrentWeather(List<MainCityBox> box);
  Future<void> persistMainCitiesForecast(List<MainCityBox> box);
}
