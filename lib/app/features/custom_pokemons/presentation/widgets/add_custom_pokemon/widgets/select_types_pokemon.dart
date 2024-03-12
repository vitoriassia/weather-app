import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/app/core/design/res/app_colors.dart';
import 'package:pokedex_app/app/core/design/res/dimen.dart';
import 'package:pokedex_app/app/core/design/styles/text_style.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_type_entity.dart';
import 'package:pokedex_app/app/features/home/presentation/widgets/pokemon_card/pokemon_type.dart';
import 'package:pokedex_app/app/shared/presentation/app_dialog.dart';
import 'package:pokedex_app/app/shared/presentation/stadium_button.dart';

class SelectTypesPokemon extends StatefulWidget {
  final Function(List<PokemonTypeEntity> list) onSave;
  final List<PokemonTypeEntity> preSelectList;
  const SelectTypesPokemon({
    Key? key,
    required this.onSave,
    required this.preSelectList,
  }) : super(key: key);

  static const List<PokemonTypeEntity> listTypes = [
    PokemonTypeEntity(name: 'bug', id: 1),
    PokemonTypeEntity(name: 'dark', id: 2),
    PokemonTypeEntity(name: 'dragon', id: 3),
    PokemonTypeEntity(name: 'electric', id: 4),
    PokemonTypeEntity(name: 'fairy', id: 5),
    PokemonTypeEntity(name: 'fighting', id: 6),
    PokemonTypeEntity(name: 'fire', id: 7),
    PokemonTypeEntity(name: 'flying', id: 8),
    PokemonTypeEntity(name: 'ghost', id: 9),
    PokemonTypeEntity(name: 'grass', id: 10),
    PokemonTypeEntity(name: 'ground', id: 11),
    PokemonTypeEntity(name: 'ice', id: 12),
    PokemonTypeEntity(name: 'normal', id: 13),
    PokemonTypeEntity(name: 'poison', id: 14),
    PokemonTypeEntity(name: 'psychic', id: 15),
    PokemonTypeEntity(name: 'rock', id: 16),
    PokemonTypeEntity(name: 'steel', id: 17),
    PokemonTypeEntity(name: 'water', id: 18),
  ];

  @override
  State<SelectTypesPokemon> createState() => _SelectTypesPokemonState();
}

class _SelectTypesPokemonState extends State<SelectTypesPokemon> {
  final List<PokemonTypeEntity?> _listSelected = [null, null, null];

  void _selectItem(PokemonTypeEntity pokemonTypeEntity) {
    int emptyIndex = _listSelected.indexWhere((element) => element == null);

    _listSelected[emptyIndex] = pokemonTypeEntity;
    _listPokemonTypes.remove(pokemonTypeEntity);
    setState(() {});
  }

  void _removeItem(PokemonTypeEntity pokemonTypeEntity) {
    int selectedIndex = _listSelected.indexOf(pokemonTypeEntity);
    _listSelected[selectedIndex] = null;
    _listPokemonTypes.add(pokemonTypeEntity);
    setState(() {});
  }

  final List<PokemonTypeEntity> _listPokemonTypes = [];

  List<PokemonTypeEntity> get _savedList {
    List<PokemonTypeEntity> list = [];
    for (var item in _listSelected) {
      if (item != null) list.add(item);
    }
    return list;
  }

  @override
  void initState() {
    _listPokemonTypes.addAll(SelectTypesPokemon.listTypes);
    _preSelectItens();
    super.initState();
  }

  void _preSelectItens() {
    for (var i = 0; i < widget.preSelectList.length; i++) {
      _listSelected[i] = widget.preSelectList[i];
    }
  }

  @override
  Widget build(BuildContext context) {
    final heightCard = MediaQuery.of(context).size.height * 0.80;
    return AppDialog(
      color: Colors.white,
      height: heightCard,
      child: Padding(
        padding: const EdgeInsets.all(PokedexDimen.medium),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Column(
                    children: [
                      Text(
                        'Selected Types:',
                        style: PokedexTextStyle.headline3,
                      ),
                      const SizedBox(
                        height: PokedexDimen.large,
                      ),
                      _buildTypesSelected()
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: _buildTypes(),
            ),
            StadiumButton(
              onPressed: () {
                widget.onSave(_savedList);
                Get.back();
              },
              label: 'Save',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypes() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: _listPokemonTypes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => {
            if (_listSelected.contains(null))
              {
                _selectItem(_listPokemonTypes[index]),
              }
          },
          child: PokemonTypeWidget(
            _listPokemonTypes[index],
            width: 60,
          ),
        );
      },
    );
  }

  Widget _buildTypesSelected() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _listSelected
          .map(
            (type) => type != null
                ? GestureDetector(
                    onTap: () => _removeItem(type),
                    child: Stack(
                      children: [
                        PokemonTypeWidget(
                          type,
                          width: 60,
                        ),
                        Positioned(
                          left: 40,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.cancel,
                              color: AppColors.redPokedexColor,
                              size: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : _buildEmptySelected,
          )
          .toList(),
    );
  }

  Widget get _buildEmptySelected => Container(
        width: 58,
        height: 58,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
      );
}
