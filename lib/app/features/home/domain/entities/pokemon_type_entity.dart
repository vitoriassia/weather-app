import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/app/core/design/res/app_colors.dart';
import 'package:pokedex_app/app/core/storage/custom_pokemon/adapters/pokemon_type/pokemon_type_box.dart';

class PokemonTypeEntity extends Equatable {
  final String name;
  final int id;
  const PokemonTypeEntity({
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [name, id];

  PokemonTypeBox toBox() => PokemonTypeBox(
        id: id,
        name: name,
      );

  Color get color {
    switch (name) {
      case 'grass':
        return AppColors.lightGreen;

      case 'bug':
        return AppColors.lightTeal;

      case 'fire':
        return AppColors.lightRed;

      case 'water':
        return AppColors.lightBlue;

      case 'fighting':
        return AppColors.red;

      case 'normal':
        return AppColors.beige;

      case 'electric':
        return AppColors.lightYellow;

      case 'psychic':
        return AppColors.lightPink;

      case 'poison':
        return AppColors.lightPurple;

      case 'ghost':
        return AppColors.purple;

      case 'ground':
        return AppColors.darkBrown;

      case 'rock':
        return AppColors.lightBrown;

      case 'dark':
        return AppColors.black;

      case 'dragon':
        return AppColors.violet;

      case 'fairy':
        return AppColors.pink;

      case 'flying':
        return AppColors.lilac;

      case 'ice':
        return AppColors.lightCyan;

      case 'steel':
        return AppColors.grey;

      default:
        return AppColors.lightBlue;
    }
  }
}
