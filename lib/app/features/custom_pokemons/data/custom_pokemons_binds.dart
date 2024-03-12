import 'package:get/instance_manager.dart';
import 'package:pokedex_app/app/core/binds/binds_helper.dart';
import 'package:pokedex_app/app/core/storage/custom_pokemon/custom_pokemon_reader.dart';
import 'package:pokedex_app/app/core/storage/custom_pokemon/custom_pokemon_writer.dart';
import 'package:pokedex_app/app/features/custom_pokemons/data/implementations/custom_pokemons_local_data_source_impl.dart';
import 'package:pokedex_app/app/features/custom_pokemons/data/implementations/custom_pokemons_repository_impl.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/useCases/delete_custom_pokemon_use_case.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/useCases/get_list_custom_pokemons_use_case.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/useCases/register_custom_pokemon_use_case.dart';
import 'package:pokedex_app/app/features/custom_pokemons/presentation/controllers/custom_pokemons_controller.dart';

class CustomPokemonsBinds implements Bindings {
  @override
  void dependencies() {
    // ============ STORAGE ============ //
    Get.put<CustomPokemonReader>(
      CustomPokemonReader.getInstance(),
    );
    Get.put<CustomPokemonWriter>(
      CustomPokemonWriter.getInstance(),
    );

    BindsHelper.get<CustomPokemonReader>().initializeBox();
    BindsHelper.get<CustomPokemonWriter>().initializeBox();

    // ================== DOMAIN =================== //
    Get.put<CustomPokemonsLocalDataSourceImpl>(
      CustomPokemonsLocalDataSourceImpl(
        BindsHelper.get<CustomPokemonWriter>(),
        BindsHelper.get<CustomPokemonReader>(),
      ),
    );
    Get.put<CustomPokemonsRepositoryImpl>(
      CustomPokemonsRepositoryImpl(
        BindsHelper.get<CustomPokemonsLocalDataSourceImpl>(),
      ),
    );
    // ================== USE CASES ============== //
    Get.put<RegisterCustomPokemonUseCase>(
      RegisterCustomPokemonUseCase(
        BindsHelper.get<CustomPokemonsRepositoryImpl>(),
      ),
    );
    Get.put<GetListCustomPokemonsUseCase>(
      GetListCustomPokemonsUseCase(
        BindsHelper.get<CustomPokemonsRepositoryImpl>(),
      ),
    );
    Get.put<DeleteCustomPokemonUseCase>(
      DeleteCustomPokemonUseCase(
        BindsHelper.get<CustomPokemonsRepositoryImpl>(),
      ),
    );
    // ================ CONTROLLER =============== //

    Get.put<CustomPokemonsController>(
      CustomPokemonsController(
        BindsHelper.get<RegisterCustomPokemonUseCase>(),
        BindsHelper.get<GetListCustomPokemonsUseCase>(),
        BindsHelper.get<DeleteCustomPokemonUseCase>(),
      ),
    );
  }
}
