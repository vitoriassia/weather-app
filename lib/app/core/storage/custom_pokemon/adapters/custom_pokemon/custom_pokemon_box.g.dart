// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_pokemon_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomPokemonBoxAdapter extends TypeAdapter<CustomPokemonBox> {
  @override
  final int typeId = 0;

  @override
  CustomPokemonBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomPokemonBox(
      id: fields[0] as int,
      name: fields[1] as String,
      imagePath: fields[2] as String?,
      types: (fields[3] as List).cast<PokemonTypeBox>(),
    );
  }

  @override
  void write(BinaryWriter writer, CustomPokemonBox obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.types);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomPokemonBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
