import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex_app/app/core/services/api/errors/failures.dart';
import 'package:pokedex_app/app/core/shared/domain/use_case.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/entities/custom_pokemon_entity.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/repositories/custom_pokemons_repository.dart';

class RegisterCustomPokemonUseCase
    implements UseCase<RegisterCustomPokemonParams, void> {
  final CustomPokemonsRepository _repository;

  RegisterCustomPokemonUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(RegisterCustomPokemonParams params) async {
    return await _repository.registerCustomPokemon(
      params.customPokemonEntity,
    );
  }
}

class RegisterCustomPokemonParams extends Equatable {
  final CustomPokemonEntity customPokemonEntity;
  const RegisterCustomPokemonParams({
    required this.customPokemonEntity,
  });

  @override
  List<Object> get props => [customPokemonEntity];
}
