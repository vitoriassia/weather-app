import 'package:equatable/equatable.dart';
import 'package:weather_app/app/core/extension/date_time_ext.dart';
import 'package:weather_app/app/core/storage/main_cities/adapters/weather_box/weather_box.dart';

class WeatherEntity extends Equatable {
  final String icon;
  final String weather;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String? abrWeekDay;
  const WeatherEntity({
    required this.icon,
    required this.weather,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.abrWeekDay,
  });

  WeatherBox toBox() => WeatherBox(
      icon: icon,
      weather: weather,
      temp: temp,
      maxTemp: maxTemp,
      minTemp: minTemp,
      abrWeekDay: abrWeekDay);

  @override
  String toString() {
    return 'WeatherEntity{ icon: $icon, weather: $weather, temp: $temp, maxTemp: $maxTemp, minTemp: $minTemp,}';
  }

  factory WeatherEntity.fromMap(Map<String, dynamic> map) {
    return WeatherEntity(
      icon: map['weather'][0]['icon'] as String,
      weather: map['weather'][0]['main'] as String,
      temp: double.parse(map['main']['temp'].toString()),
      maxTemp: double.parse(map['main']['temp_max'].toString()),
      minTemp: double.parse(map['main']['temp_min'].toString()),
      abrWeekDay: DateTime.tryParse(map['dt_txt'] ?? '').getAbrMonth(),
    );
  }

  @override
  List<Object?> get props => [
        icon,
        weather,
        temp,
        maxTemp,
        minTemp,
      ];
}
