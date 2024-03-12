import 'package:flutter/material.dart';

import 'package:pokedex_app/app/core/design/images/app_images.dart';
import 'package:pokedex_app/app/core/design/res/dimen.dart';
import 'package:pokedex_app/app/core/design/styles/text_style.dart';
import 'package:pokedex_app/app/features/custom_pokemons/presentation/widgets/add_custom_pokemon/widgets/custom_pokemon_image.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/features/home/presentation/widgets/pokemon_card/pokemon_image.dart';
import 'package:pokedex_app/app/features/home/presentation/widgets/pokemon_card/pokemon_type.dart';

class PokemonCard extends StatelessWidget {
  static const double _pokeballFraction = 0.75;

  final PokemonEntity pokemon;
  final bool isCustomPokemon;
  final String? imagePath;
  final void Function()? onPress;

  const PokemonCard(this.pokemon,
      {super.key, this.onPress, this.isCustomPokemon = false, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final itemHeight = constrains.maxHeight;

        return Container(
          decoration: BoxDecoration(
            color: pokemon.color,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: pokemon.color.withOpacity(0.4),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              color: pokemon.color,
              child: InkWell(
                onTap: onPress,
                splashColor: Colors.white10,
                highlightColor: Colors.white10,
                child: Stack(
                  children: [
                    _buildPokeballDecoration(height: itemHeight),
                    _buildPokemon(height: itemHeight),
                    _buildPokemonNumber(),
                    _CardContent(pokemon),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPokeballDecoration({required double height}) {
    final pokeballSize = height * _pokeballFraction;

    return Positioned(
      bottom: -height * 0.13,
      right: -height * 0.03,
      child: Image(
        image: AppImages.pokeball,
        width: pokeballSize,
        height: pokeballSize,
        color: Colors.white.withOpacity(0.3),
      ),
    );
  }

  Widget _buildPokemon({
    required double height,
  }) {
    final pokemonSize = height * PokedexDimen.pokemonFraction;

    return Positioned(
      bottom: -2,
      right: 2,
      child: isCustomPokemon
          ? CustomPokemonImage(
              size: Size.square(pokemonSize),
              imagePath: imagePath,
            )
          : PokemonImage(
              size: Size.square(pokemonSize),
              pokemon: pokemon,
            ),
    );
  }

  Widget _buildPokemonNumber() {
    return Positioned(
      top: 10,
      right: 14,
      child: Text(
        pokemon.number,
        style: PokedexTextStyle.bodyBold.copyWith(color: Colors.white),
      ),
    );
  }
}

class _CardContent extends StatelessWidget {
  final PokemonEntity pokemon;

  const _CardContent(this.pokemon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 15, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: pokemon.number + pokemon.name,
                child: Text(
                  pokemon.name,
                  style: PokedexTextStyle.bodyBold
                      .copyWith(color: Colors.white, height: 0.7),
                ),
              ),
            ),
            _buildTypes(),
          ],
        ),
      ),
    );
  }

  Widget _buildTypes() {
    return Row(
      children: pokemon.types
          .take(2)
          .map(
            (type) => Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: PokemonTypeWidget(type),
            ),
          )
          .toList(),
    );
  }
}
