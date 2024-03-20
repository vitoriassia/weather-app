import 'package:flutter/material.dart';
import 'package:weather_app/app/core/design/images/app_images.dart';
import 'package:weather_app/app/core/design/res/app_colors.dart';
import 'package:weather_app/app/core/design/res/dimen.dart';
import 'package:weather_app/app/core/design/styles/text_style.dart';
import 'package:weather_app/app/core/extension/color_extension.dart';
import 'package:weather_app/app/features/home/domain/entities/weather_entity.dart';

class ForeCastItemCard extends StatelessWidget {
  final WeatherEntity entity;
  const ForeCastItemCard({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColorDark.lighten(0.2),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              entity.abrWeekDay ?? '',
              style: AppTextStyle.body2,
            ),
            const SizedBox(
              height: AppDimen.xxSmall,
            ),
            Image(
              image: AppImages.weatherIcon(entity.icon),
              height: 40,
              width: 40,
            ),
            const SizedBox(
              height: AppDimen.xxSmall,
            ),
            Text(
              '${entity.temp}º',
              style: AppTextStyle.body2,
            ),
          ],
        ),
      ),
    );
  }
}
