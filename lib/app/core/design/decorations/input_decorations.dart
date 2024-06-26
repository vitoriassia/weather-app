import 'package:flutter/material.dart';
import 'package:weather_app/app/core/design/res/app_colors.dart';
import 'package:weather_app/app/core/design/res/dimen.dart';

abstract class PokedexDecorations {
  static const borderInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 22),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppDimen.normal))),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(AppDimen.normal)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black12, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(AppDimen.normal)),
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
