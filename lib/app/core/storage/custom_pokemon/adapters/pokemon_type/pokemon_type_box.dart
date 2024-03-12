import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex_app/app/core/storage/config/storage_binds.dart';

part 'pokemon_type_box.g.dart';

@HiveType(typeId: StorageBinds.pokemonTypeId)
class PokemonTypeBox {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  PokemonTypeBox({
    required this.id,
    required this.name,
  });
}
