import 'package:pokedex_app/app/features/home/domain/entities/pokemon_ability_entity.dart';

class PokemonAbilityModel extends PokemonAbilityEntity {
  const PokemonAbilityModel({
    required super.name,
    required super.id,
  });

  factory PokemonAbilityModel.fromJson(Map<String, dynamic> json) =>
      PokemonAbilityModel(name: json['name'], id: null);
}
