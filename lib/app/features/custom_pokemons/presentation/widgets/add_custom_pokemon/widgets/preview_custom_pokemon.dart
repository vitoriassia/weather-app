import 'package:flutter/material.dart';
import 'package:pokedex_app/app/core/design/res/dimen.dart';
import 'package:pokedex_app/app/core/design/styles/text_style.dart';
import 'package:pokedex_app/app/features/custom_pokemons/domain/entities/custom_pokemon_entity.dart';
import 'package:pokedex_app/app/features/custom_pokemons/presentation/widgets/add_custom_pokemon/widgets/custom_pokemon_image.dart';
import 'package:pokedex_app/app/features/home/presentation/widgets/pokemon_card/pokemon_type.dart';
import 'package:pokedex_app/app/shared/presentation/app_dialog/semi_background.dart';

class PreviewPokemonCard extends StatelessWidget {
  final CustomPokemonEntity pokemonEntity;
  final double padding;
  const PreviewPokemonCard(
      {Key? key,
      required this.pokemonEntity,
      this.padding = PokedexDimen.medium})
      : super(key: key);

  final double heightCard = 220;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Card(
        elevation: 5,
        child: SizedBox(
          height: heightCard,
          child: Stack(
            children: [
              SemiBackground(
                height: heightCard,
                color: pokemonEntity.color.withOpacity(0.7),
              ),
              _buildPokemon(height: heightCard),
              _buildPokemonInfos(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPokemon({required double height}) {
    final pokemonSize = height * PokedexDimen.pokemonFraction;

    return Positioned(
      bottom: -2,
      right: 2,
      child: CustomPokemonImage(
        size: Size.square(pokemonSize),
        imagePath: pokemonEntity.imagePath,
      ),
    );
  }

  Widget _buildTypes() {
    if (pokemonEntity.types.isEmpty) return Container();
    return Column(
      children: pokemonEntity.types
          .take(3)
          .map(
            (type) => Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Row(
                children: [
                  PokemonTypeWidget(
                    type,
                    width: 40,
                  ),
                  Container(
                    padding: const EdgeInsets.all(PokedexDimen.xxSmall),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: PokedexDimen.medium,
                      ),
                      child: Text(
                        type.name.toUpperCase(),
                        style: PokedexTextStyle.body,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildPokemonInfos() {
    return Padding(
      padding: const EdgeInsets.all(PokedexDimen.normal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: pokemonEntity.name.isNotEmpty,
                child: Text(
                  pokemonEntity.name,
                  style: PokedexTextStyle.headline,
                ),
              ),
              Visibility(
                visible: pokemonEntity.name.isEmpty,
                child: Container(
                  padding: const EdgeInsets.all(PokedexDimen.xxSmall),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: PokedexDimen.medium,
                    ),
                    child: Text(
                      'Pokemon Name',
                      style: PokedexTextStyle.body,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: PokedexDimen.xLarge),
                child: Text(
                  pokemonEntity.number,
                  style: PokedexTextStyle.headline,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          _buildTypes(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
