import 'package:hive_flutter/adapters.dart';
import 'package:pokedex_app/app/core/storage/custom_pokemon/adapters/custom_pokemon/custom_pokemon_box.dart';
import 'package:pokedex_app/app/core/storage/custom_pokemon/adapters/pokemon_type/pokemon_type_box.dart';

abstract class HiveInitializer {
  static call() async {
    Hive.registerAdapter(CustomPokemonBoxAdapter());
    Hive.registerAdapter(PokemonTypeBoxAdapter());
    await Hive.initFlutter();
  }
}
