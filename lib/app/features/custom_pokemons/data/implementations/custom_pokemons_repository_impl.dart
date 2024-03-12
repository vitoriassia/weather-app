import 'package:pokedex_app/app/core/services/api/errors/exception_handler_scope.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/datasources/custom_pokemons_local_data_source.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/entities/custom_pokemon_entity.dart';
import 'package:pokedex_app/app/core/services/api/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/repositories/custom_pokemons_repository.dart';

class CustomPokemonsRepositoryImpl extends CustomPokemonsRepository {
  final CustomPokemonsLocalDataSource _localDataSource;
  CustomPokemonsRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, void>> registerCustomPokemon(
      CustomPokemonEntity customPokemonEntity) {
    return repositoryExceptionHandlerScope(() async {
      await _localDataSource.registerCustomPokemon(customPokemonEntity);
    });
  }

  @override
  List<CustomPokemonEntity> getListCustomPokemons() =>
      _localDataSource.getListCustomPokemons();

  @override
  Future<Either<Failure, void>> deleteCustomPokemon(int pokemonId) {
    return repositoryExceptionHandlerScope(() async {
      await _localDataSource.deleteCustomPokemon(pokemonId);
    });
  }
}
