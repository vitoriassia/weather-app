import 'package:dartz/dartz.dart';
import 'package:pokedex_app/app/core/services/api/errors/failures.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/entities/custom_pokemon_entity.dart';

abstract class CustomPokemonsRepository {
  Future<Either<Failure, void>> registerCustomPokemon(
      CustomPokemonEntity customPokemonEntity);

  List<CustomPokemonEntity> getListCustomPokemons();

  Future<Either<Failure, void>> deleteCustomPokemon(int pokemonId);
}
