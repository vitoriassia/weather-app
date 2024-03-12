import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex_app/app/core/services/api/errors/failures.dart';
import 'package:pokedex_app/app/core/shared/domain/use_case.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/repositories/custom_pokemons_repository.dart';

class DeleteCustomPokemonUseCase
    implements UseCase<DeletePokemonUseCaseParams, void> {
  final CustomPokemonsRepository _repository;

  DeleteCustomPokemonUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(DeletePokemonUseCaseParams params) async {
    return await _repository.deleteCustomPokemon(
      params.pokemonId,
    );
  }
}

class DeletePokemonUseCaseParams extends Equatable {
  final int pokemonId;
  const DeletePokemonUseCaseParams({
    required this.pokemonId,
  });

  @override
  List<Object> get props => [pokemonId];
}
