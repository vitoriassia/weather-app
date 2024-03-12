import 'package:dartz/dartz.dart';
import 'package:weather_app/app/core/services/api/errors/failures.dart';
import 'package:weather_app/app/features/home/domain/entities/pokemon_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<PokemonEntity>>> getListPokemons(int page);
}
