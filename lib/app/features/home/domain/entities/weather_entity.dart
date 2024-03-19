import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String icon;
  final String weather;
  final double temp;
  final double maxTemp;
  final double minTemp;
  const WeatherEntity({
    required this.icon,
    required this.weather,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
  });

  @override
  String toString() {
    return 'WeatherEntity{ icon: $icon, weather: $weather, temp: $temp, maxTemp: $maxTemp, minTemp: $minTemp,}';
  }

  factory WeatherEntity.fromMap(Map<String, dynamic> map) {
    return WeatherEntity(
      icon: map['weather'][0]['icon'] as String,
      weather: map['weather'][0]['main'] as String,
      temp: map['main']['temp'] as double,
      maxTemp: map['main']['temp_max'] as double,
      minTemp: map['main']['temp_min'] as double,
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
