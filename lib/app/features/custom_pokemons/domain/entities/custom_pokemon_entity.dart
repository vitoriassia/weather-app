import 'package:flutter/material.dart';
import 'package:pokedex_app/app/core/storage/custom_pokemon/adapters/custom_pokemon/custom_pokemon_box.dart';
import 'package:pokedex_app/app/core/storage/custom_pokemon/adapters/pokemon_type/pokemon_type_box.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_type_entity.dart';

class CustomPokemonEntity extends PokemonEntity {
  final String? imagePath;
  const CustomPokemonEntity({
    required this.imagePath,
    required super.id,
    required super.types,
    required super.name,
    required super.abilities,
  });

  @override
  Color get color => types.isNotEmpty ? types.first.color : Colors.grey;

  @override
  List<Object?> get props => [imagePath, id, types, name, abilities];

  CustomPokemonEntity copyWith({
    String? name,
    String? imagePath,
    int? id,
    List<PokemonTypeEntity>? types,
  }) {
    return CustomPokemonEntity(
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      id: id ?? this.id,
      types: types ?? this.types,
      abilities: const [],
    );
  }

  CustomPokemonBox toBox() => CustomPokemonBox(
        id: id,
        name: name,
        imagePath: imagePath,
        types: List<PokemonTypeBox>.from(
          types.map(
            (t) => t.toBox(),
          ),
        ),
      );
}
