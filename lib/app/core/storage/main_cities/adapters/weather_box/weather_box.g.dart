// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherBoxAdapter extends TypeAdapter<WeatherBox> {
  @override
  final int typeId = 2;

  @override
  WeatherBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherBox(
      icon: fields[0] as String,
      weather: fields[1] as String,
      temp: fields[2] as double,
      maxTemp: fields[3] as double,
      minTemp: fields[4] as double,
      abrWeekDay: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherBox obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.icon)
      ..writeByte(1)
      ..write(obj.weather)
      ..writeByte(2)
      ..write(obj.temp)
      ..writeByte(3)
      ..write(obj.maxTemp)
      ..writeByte(4)
      ..write(obj.minTemp)
      ..writeByte(5)
      ..write(obj.abrWeekDay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
