import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/app/core/binds/binds_helper.dart';
import 'package:pokedex_app/app/core/design/res/app_colors.dart';
import 'package:pokedex_app/app/core/design/res/dimen.dart';
import 'package:pokedex_app/app/core/shared/presentation/ui_state.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/entities/custom_pokemon_entity.dart';
import 'package:pokedex_app/app/features/custom_pokemons/presentation/controllers/custom_pokemons_controller.dart';
import 'package:pokedex_app/app/features/custom_pokemons/presentation/widgets/add_custom_pokemon/add_custom_pokemon_widget.dart';
import 'package:pokedex_app/app/features/custom_pokemons/presentation/widgets/add_custom_pokemon/widgets/preview_custom_pokemon.dart';
import 'package:pokedex_app/app/shared/presentation/app_dialog.dart';
import 'package:pokedex_app/app/shared/presentation/stadium_button.dart';

class CustomPokemonDetail extends StatefulWidget {
  final CustomPokemonEntity pokemonEntity;
  const CustomPokemonDetail({Key? key, required this.pokemonEntity})
      : super(key: key);

  @override
  State<CustomPokemonDetail> createState() => _CustomPokemonDetailState();
}

class _CustomPokemonDetailState extends State<CustomPokemonDetail> {
  final CustomPokemonsController _controller =
      BindsHelper.get<CustomPokemonsController>();

  late Worker _ever;

  @override
  void initState() {
    _ever = ever(_controller.deleteUiState, _listenUiState);

    super.initState();
  }

  void _listenUiState(UiState value) {
    if (value is Success<void>) {
      _controller.getListCustomPokemons();
      Get.back();
    }

    if (value is ErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(value.message),
        ),
      );
    }
  }

  @override
  void dispose() {
    _ever.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final heightCard = MediaQuery.of(context).size.height * 0.60;
    return AppDialog(
      color: const Color.fromARGB(255, 163, 9, 50),
      height: heightCard,
      child: Padding(
        padding: const EdgeInsets.all(PokedexDimen.small),
        child: Column(
          children: [
            PreviewPokemonCard(
              pokemonEntity: widget.pokemonEntity,
              padding: 0,
            ),
            const SizedBox(
              height: 20,
            ),
            StadiumButton(
                onPressed: () {
                  Get.back();
                  Get.to(
                    () => AddCustomPokemonWidget(
                      editCustomPokemon: widget.pokemonEntity,
                    ),
                  );
                },
                label: 'Edit Pokemon'),
            Obx(
              () => StadiumButton(
                onPressed: () {
                  _controller.deleteCustomPokemon(widget.pokemonEntity.id);
                },
                label: 'Delete Pokemon',
                isLoading: _controller.deleteUiState.value is Loading,
                buttonColor: AppColors.textColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
