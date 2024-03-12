// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:pokedex_app/app/core/services/api/errors/failures.dart';
import 'package:pokedex_app/app/core/shared/domain/use_case.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/features/home/domain/repositories/home_repository.dart';

class GetListPokemonsUseCase
    implements UseCase<GetListPokemonsParams, List<PokemonEntity>> {
  final HomeRepository _repository;

  GetListPokemonsUseCase(this._repository);

  @override
  Future<Either<Failure, List<PokemonEntity>>> call(
      GetListPokemonsParams params) async {
    return await _repository.getListPokemons(params.page);
  }
}

class GetListPokemonsParams extends Equatable {
  final int page;
  const GetListPokemonsParams({
    required this.page,
  });

  @override
  List<Object> get props => [page];
}
