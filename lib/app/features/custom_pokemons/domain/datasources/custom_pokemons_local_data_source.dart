import 'package:pokedex_app/app/features/custom_pokemons/domain/entities/custom_pokemon_entity.dart';

abstract class CustomPokemonsLocalDataSource {
  Future<void> registerCustomPokemon(CustomPokemonEntity customPokemonEntity);

  List<CustomPokemonEntity> getListCustomPokemons();

  Future<void> deleteCustomPokemon(int pokemonId);
}
