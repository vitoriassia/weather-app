import 'package:pokedex_app/app/features/home/data/models/pokemon_ability_model.dart';
import 'package:pokedex_app/app/features/home/data/models/pokemon_type_model.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_ability_entity.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_type_entity.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel(
      {required super.name,
      required super.id,
      required super.types,
      required super.abilities});

  factory PokemonModel.fromJson(Map<String, dynamic> map) {
    return PokemonModel(
      name: map['name'] as String,
      id: map['id'] as int,
      types: List<PokemonTypeEntity>.from(
        map['types'].map<PokemonTypeEntity>(
          (x) => PokemonTypeModel.fromJson(
            x['type'],
          ),
        ),
      ),
      abilities: List<PokemonAbilityEntity>.from(
        (map['abilities']).map<PokemonAbilityEntity>(
          (x) => PokemonAbilityModel.fromJson(
            x['ability'],
          ),
        ),
      ),
    );
  }
}
