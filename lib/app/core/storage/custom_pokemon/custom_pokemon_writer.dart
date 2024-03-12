import 'package:hive/hive.dart';
import 'package:pokedex_app/app/core/storage/config/hive_box_writer.dart';
import 'package:pokedex_app/app/core/storage/config/storage_binds.dart';
import 'package:pokedex_app/app/core/storage/custom_pokemon/adapters/custom_pokemon/custom_pokemon_box.dart';
import 'dart:developer' as developer;

class CustomPokemonWriter extends HiveBoxWriter<CustomPokemonBox> {
  static CustomPokemonWriter? _instance;
  late final Box<CustomPokemonBox> _box;
  static const _key = StorageBinds.customPokemonKey;

  CustomPokemonWriter._();

  @override
  Box<CustomPokemonBox> get box => _box;

  static CustomPokemonWriter getInstance() {
    _instance ??= CustomPokemonWriter._();
    return _instance!;
  }

  @override
  Future initializeBox() async {
    _box = Hive.isBoxOpen(_key) ? Hive.box(_key) : await Hive.openBox(_key);
  }

  @override
  Future<void> put(CustomPokemonBox adapter) async {
    developer.log(adapter.toString(), name: "INSERT/EDIT DATA:");

    await box.put(adapter.id, adapter);
  }

  Future<void> delete(int id) async {
    await box.delete(id);
  }

  @override
  Future<void> putAll(List<CustomPokemonBox> adapters) async {
    for (var adapter in adapters) {
      await put(adapter);
    }
  }
}
