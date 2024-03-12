import 'package:flutter/material.dart';
import 'package:pokedex_app/app/core/design/res/app_colors.dart';
import 'package:pokedex_app/app/core/design/res/dimen.dart';

abstract class PokedexDecorations {
  static const borderInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 22),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(PokedexDimen.normal))),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.redPokedexColor, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(PokedexDimen.normal)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black12, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(PokedexDimen.normal)),
    ),
    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
  );

  static const gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 1.4,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  );
}
