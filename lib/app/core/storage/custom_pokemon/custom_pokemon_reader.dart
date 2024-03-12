import 'package:hive/hive.dart';
import 'package:pokedex_app/app/core/storage/config/hive_box_reader.dart';
import 'package:pokedex_app/app/core/storage/config/storage_binds.dart';
import 'package:pokedex_app/app/core/storage/custom_pokemon/adapters/custom_pokemon/custom_pokemon_box.dart';

class CustomPokemonReader extends HiveBoxReader<CustomPokemonBox> {
  static CustomPokemonReader? _instance;
  late final Box<CustomPokemonBox> _box;
  static const _key = StorageBinds.customPokemonKey;

  CustomPokemonReader._();

  @override
  Box<CustomPokemonBox> get box => _box;

  static CustomPokemonReader getInstance() {
    _instance ??= CustomPokemonReader._();
    return _instance!;
  }

  @override
  Future initializeBox() async {
    _box = Hive.isBoxOpen(_key)
        ? Hive.box(
            _key,
          )
        : await Hive.openBox(
            _key,
          );
  }
}
