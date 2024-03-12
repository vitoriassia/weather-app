import 'package:pokedex_app/app/core/storage/custom_pokemon/adapters/pokemon_type/pokemon_type_box.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_type_entity.dart';

class PokemonTypeModel extends PokemonTypeEntity {
  const PokemonTypeModel({
    required super.name,
    required super.id,
  });

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) =>
      PokemonTypeModel(name: json['name'], id: 0);

  factory PokemonTypeModel.fromBox(PokemonTypeBox box) =>
      PokemonTypeModel(name: box.name, id: box.id);
}
