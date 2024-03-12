import 'package:pokedex_app/app/features/custom_pokemons/domain/entities/custom_pokemon_entity.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/repositories/custom_pokemons_repository.dart';

class GetListCustomPokemonsUseCase {
  final CustomPokemonsRepository _repository;

  GetListCustomPokemonsUseCase(this._repository);

  List<CustomPokemonEntity> call() {
    return _repository.getListCustomPokemons();
  }
}
