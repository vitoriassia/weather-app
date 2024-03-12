import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/app/core/design/decorations/input_decorations.dart';
import 'package:pokedex_app/app/features/custom_pokemons/presentation/controllers/custom_pokemons_controller.dart';
import 'package:pokedex_app/app/features/custom_pokemons/presentation/widgets/custom_pokemon_detail_card.dart';
import 'package:pokedex_app/app/features/home/presentation/widgets/pokemon_card/pokemon_card.dart';
import 'package:pokedex_app/app/shared/presentation/show_dialog_with_scale_animation.dart';

class ListCustomPokemons extends StatelessWidget {
  final CustomPokemonsController customPokemonsController;
  const ListCustomPokemons({
    Key? key,
    required this.customPokemonsController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GridView.builder(
        gridDelegate: PokedexDecorations.gridDelegate,
        itemCount: customPokemonsController.listCustomPokemons.length,
        itemBuilder: (_, index) {
          final customPokemon =
              customPokemonsController.listCustomPokemons[index];
          return PokemonCard(
            customPokemon,
            imagePath: customPokemon.imagePath,
            isCustomPokemon: true,
            onPress: () => {
              showDialogWithScaleAnimation(
                child: CustomPokemonDetail(
                  pokemonEntity: customPokemon,
                ),
                context: context,
              )
            },
          );
        },
      );
    });
  }
}
