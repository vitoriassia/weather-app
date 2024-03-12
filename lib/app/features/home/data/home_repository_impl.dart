import 'package:pokedex_app/app/core/services/api/errors/exception_handler_scope.dart';
import 'package:pokedex_app/app/features/home/domain/datasources/home_remote_data_source.dart';
import 'package:pokedex_app/app/core/services/api/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<PokemonEntity>>> getListPokemons(int page) async {
    return repositoryExceptionHandlerScope<List<PokemonEntity>>(
      () async => await _remoteDataSource.getListPokemons(page),
    );
  }
}
