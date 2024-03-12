import 'package:pokedex_app/app/core/storage/custom_pokemon/adapters/custom_pokemon/custom_pokemon_box.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/entities/custom_pokemon_entity.dart';
import 'package:pokedex_app/app/features/home/data/models/pokemon_type_model.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_type_entity.dart';

class CustomPokemonModel extends CustomPokemonEntity {
  const CustomPokemonModel(
      {required super.imagePath,
      required super.id,
      required super.types,
      required super.name,
      required super.abilities});

  factory CustomPokemonModel.fromBox(CustomPokemonBox box) =>
      CustomPokemonModel(
        imagePath: box.imagePath,
        id: box.id,
        types: List<PokemonTypeEntity>.from(
          box.types.map(
            (type) => PokemonTypeModel.fromBox(type),
          ),
        ),
        name: box.name,
        abilities: const [],
      );
}
