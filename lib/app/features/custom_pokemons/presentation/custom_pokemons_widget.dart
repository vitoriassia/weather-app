import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pokedex_app/app/core/binds/binds_helper.dart';
import 'package:pokedex_app/app/core/design/res/app_colors.dart';
import 'package:pokedex_app/app/features/custom_pokemons/presentation/controllers/custom_pokemons_controller.dart';
import 'package:pokedex_app/app/features/custom_pokemons/presentation/widgets/add_custom_pokemon/add_custom_pokemon_widget.dart';
import 'package:pokedex_app/app/features/custom_pokemons/presentation/widgets/list_custom_pokemon/list_custom_pokemons.dart';

class CustomPokemonsWidget extends StatefulWidget {
  const CustomPokemonsWidget({Key? key}) : super(key: key);

  @override
  State<CustomPokemonsWidget> createState() => _CustomPokemonsWidgetState();
}

class _CustomPokemonsWidgetState extends State<CustomPokemonsWidget> {
  final CustomPokemonsController _controller =
      BindsHelper.get<CustomPokemonsController>();

  @override
  void initState() {
    _controller.getListCustomPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(
          () => const AddCustomPokemonWidget(),
        ),
        backgroundColor: AppColors.redPokedexColor,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListCustomPokemons(
          customPokemonsController: _controller,
        ),
      ),
    );
  }
}
