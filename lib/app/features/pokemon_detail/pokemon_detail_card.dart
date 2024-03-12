import 'package:flutter/material.dart';
import 'package:pokedex_app/app/core/design/res/dimen.dart';
import 'package:pokedex_app/app/core/design/styles/text_style.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/features/home/presentation/widgets/pokemon_card/pokemon_image.dart';
import 'package:pokedex_app/app/features/home/presentation/widgets/pokemon_card/pokemon_type.dart';
import 'package:pokedex_app/app/shared/presentation/app_dialog.dart';
import 'package:pokedex_app/app/shared/presentation/app_dialog/semi_background.dart';

class PokemonDetailCard extends StatelessWidget {
  final PokemonEntity pokemonEntity;
  const PokemonDetailCard({Key? key, required this.pokemonEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightCard = MediaQuery.of(context).size.height * 0.40;
    return AppDialog(
      color: Colors.white,
      height: heightCard,
      child: Stack(
        children: [
          SemiBackground(
            height: heightCard,
            color: pokemonEntity.color.withOpacity(0.7),
          ),
          _buildPokemon(height: heightCard),
          _buildShadow(),
          _buildPokemonInfos(),
        ],
      ),
    );
  }

  Widget _buildPokemon({required double height}) {
    final pokemonSize = height * PokedexDimen.pokemonFraction;

    return Positioned(
      bottom: -2,
      right: 2,
      child: PokemonImage(
        size: Size.square(pokemonSize),
        pokemon: pokemonEntity,
      ),
    );
  }

  Widget _buildShadow() {
    return Positioned(
      bottom: 10,
      left: 185,
      child: Container(
        height: 17,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 22.0,
                offset: Offset(0.0, 0.75))
          ],
        ),
      ),
    );
  }

  Widget _buildTypes() {
    return Column(
      children: pokemonEntity.types
          .take(2)
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
            children: [
              Text(
                pokemonEntity.name,
                style: PokedexTextStyle.headline,
              ),
              const SizedBox(
                width: 100,
              ),
              Text(
                pokemonEntity.number,
                style: PokedexTextStyle.headline,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          _buildTypes(),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Abilities:',
            style: PokedexTextStyle.headline3,
          ),
          const SizedBox(
            height: 10,
          ),
          _buildAbilities(),
        ],
      ),
    );
  }

  Widget _buildAbilities() {
    return Column(
      children: pokemonEntity.abilities
          .take(2)
          .map(
            (ability) => Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Row(
                children: [
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
                        ability.name.toUpperCase(),
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
}
