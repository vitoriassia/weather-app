import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex_app/app/core/design/decorations/input_decorations.dart';
import 'package:pokedex_app/app/core/design/res/app_colors.dart';
import 'package:pokedex_app/app/core/design/res/dimen.dart';

class TextFormFieldWithLabel extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType? keyBoardType;
  final List<TextInputFormatter>? listFormatters;
  final Widget? textFormField;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final String? hintText;
  final ValueChanged<String>? onFieldSubmitted;
  final AutovalidateMode? autovalidateMode;
  final TextCapitalization capitalization;
  final int? maxLenght;
  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final bool? readOnly;
  final void Function()? onEditingComplete;
  final bool withoutValidator;
  const TextFormFieldWithLabel(
      {Key? key,
      required this.label,
      this.controller,
      this.textFormField,
      this.keyBoardType,
      this.withoutValidator = false,
      this.listFormatters,
      this.readOnly = false,
      this.onChanged,
      this.maxLenght,
      this.textInputAction = TextInputAction.done,
      this.capitalization = TextCapitalization.none,
      this.textStyle,
      this.textAlign,
      this.hintText,
      this.onFieldSubmitted,
      this.autovalidateMode,
      this.onEditingComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: PokedexDimen.small),
          child: textFormField ??
              TextFormField(
                readOnly: readOnly!,
                onEditingComplete: onEditingComplete,
                controller: controller,
                cursorColor: AppColors.redPokedexColor,
                autofocus: false,
                textInputAction: textInputAction,
                maxLength: maxLenght,
                keyboardType: keyBoardType,
                textCapitalization: capitalization,
                autovalidateMode: autovalidateMode,
                style: textStyle ?? TextStyle(color: Colors.grey[600]),
                textAlign: textAlign ?? TextAlign.left,
                inputFormatters: listFormatters,
                decoration: PokedexDecorations.borderInputDecoration
                    .copyWith(hintText: hintText, counterText: ''),
                onChanged: onChanged,
                onFieldSubmitted: onFieldSubmitted,
              ),
        )
      ],
    );
  }
}
