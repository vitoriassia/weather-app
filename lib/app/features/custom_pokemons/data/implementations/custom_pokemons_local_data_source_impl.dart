import 'package:pokedex_app/app/core/services/api/errors/exception_handler_scope.dart';
import 'package:pokedex_app/app/core/storage/custom_pokemon/custom_pokemon_reader.dart';
import 'package:pokedex_app/app/core/storage/custom_pokemon/custom_pokemon_writer.dart';
import 'package:pokedex_app/app/features/custom_pokemons/data/models/custom_pokemon_model.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/datasources/custom_pokemons_local_data_source.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/entities/custom_pokemon_entity.dart';

class CustomPokemonsLocalDataSourceImpl
    implements CustomPokemonsLocalDataSource {
  final CustomPokemonWriter _writer;
  final CustomPokemonReader _reader;

  CustomPokemonsLocalDataSourceImpl(this._writer, this._reader);

  @override
  Future<void> registerCustomPokemon(CustomPokemonEntity customPokemonEntity) {
    return localDataSourceExceptionHandlerScope(
      () async {
        await _writer.put(customPokemonEntity.toBox());
      },
    );
  }

  @override
  List<CustomPokemonEntity> getListCustomPokemons() {
    final result = _reader.getAll();

    return List<CustomPokemonEntity>.from(
        result.map((box) => CustomPokemonModel.fromBox(box)));
  }

  @override
  Future<void> deleteCustomPokemon(int pokemonId) {
    return localDataSourceExceptionHandlerScope(
      () async {
        await _writer.delete(pokemonId);
      },
    );
  }
}
