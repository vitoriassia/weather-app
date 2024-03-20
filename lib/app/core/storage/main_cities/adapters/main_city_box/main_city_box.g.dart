// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_city_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainCityBoxAdapter extends TypeAdapter<MainCityBox> {
  @override
  final int typeId = 0;

  @override
  MainCityBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainCityBox(
      name: fields[0] as String,
      latLngEntity: fields[1] as LatLongBox,
      currentWeather: fields[2] as WeatherBox?,
      forecast: (fields[3] as List?)?.cast<WeatherBox>(),
      identifier: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MainCityBox obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.latLngEntity)
      ..writeByte(2)
      ..write(obj.currentWeather)
      ..writeByte(3)
      ..write(obj.forecast)
      ..writeByte(4)
      ..write(obj.identifier);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainCityBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
