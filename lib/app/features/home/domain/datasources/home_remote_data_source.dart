import 'package:pokedex_app/app/features/home/domain/entities/pokemon_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<PokemonEntity>> getListPokemons(int page);
}
