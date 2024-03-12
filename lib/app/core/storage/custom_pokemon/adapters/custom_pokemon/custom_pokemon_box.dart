import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex_app/app/core/storage/config/storage_binds.dart';
import 'package:pokedex_app/app/core/storage/custom_pokemon/adapters/pokemon_type/pokemon_type_box.dart';
part 'custom_pokemon_box.g.dart';

@HiveType(typeId: StorageBinds.customPokemonId)
class CustomPokemonBox {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String? imagePath;

  @HiveField(3)
  List<PokemonTypeBox> types;

  CustomPokemonBox({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.types,
  });
}
