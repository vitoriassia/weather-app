import 'package:flutter/material.dart';

import 'package:pokedex_app/app/core/design/res/app_colors.dart';

class StadiumButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final IconData? icon;
  final String label;
  final bool expandedButton;
  final double? fontSize;
  final bool leftIcon;
  final bool isLoading;
  const StadiumButton(
      {Key? key,
      required this.onPressed,
      this.leftIcon = true,
      this.expandedButton = false,
      this.buttonColor,
      this.icon,
      this.fontSize,
      this.isLoading = false,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: leftIcon ? TextDirection.ltr : TextDirection.rtl,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: buttonColor ?? AppColors.redPokedexColor),
        onPressed: isLoading ? () {} : onPressed,
        icon: Visibility(
          visible: icon != null,
          child: Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
        ),
        label: SizedBox(
          width: expandedButton ? double.infinity : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Stack(
              children: [
                Visibility(
                    visible: isLoading,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )),
                Visibility(
                    visible: !isLoading,
                    child: Center(
                      child: Text(
                        label.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize ?? 15,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
