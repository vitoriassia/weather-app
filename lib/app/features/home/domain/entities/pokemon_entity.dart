import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_ability_entity.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_type_entity.dart';

class PokemonEntity extends Equatable {
  final String name;
  final int id;
  final List<PokemonTypeEntity> types;
  final List<PokemonAbilityEntity> abilities;
  const PokemonEntity({
    required this.name,
    required this.id,
    required this.types,
    required this.abilities,
  });

  Color get color => types.first.color;

  String get number => id < 10
      ? '#00$id'
      : id < 100
          ? '#0$id'
          : '#$id';
  @override
  List<Object?> get props => [name, id, types, abilities];
}
