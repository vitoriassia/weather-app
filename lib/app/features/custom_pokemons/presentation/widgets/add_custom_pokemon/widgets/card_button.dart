import 'package:flutter/material.dart';
import 'package:pokedex_app/app/core/design/res/app_colors.dart';
import 'package:pokedex_app/app/core/design/styles/text_style.dart';

class CardButton extends StatelessWidget {
  final IconData icon;
  final String description;
  final VoidCallback onTap;
  const CardButton(
      {Key? key,
      required this.icon,
      required this.description,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 100,
        height: 120,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            side:
                const BorderSide(color: AppColors.redPokedexColor, width: 2.0),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppColors.redPokedexColor,
                size: 35,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: PokedexTextStyle.headline3
                    .copyWith(color: AppColors.redPokedexColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
