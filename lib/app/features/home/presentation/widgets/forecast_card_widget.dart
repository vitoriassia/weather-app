import 'package:flutter/material.dart';
import 'package:weather_app/app/core/design/res/app_colors.dart';
import 'package:weather_app/app/core/design/res/dimen.dart';
import 'package:weather_app/app/core/design/styles/text_style.dart';
import 'package:weather_app/app/core/extension/color_extension.dart';
import 'package:weather_app/app/features/home/domain/entities/main_city_entity.dart';

import 'forecast_item_card.dart';

class ForecastCardWidget extends StatelessWidget {
  final MainCityEntity entity;
  const ForecastCardWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimen.xxxSmall,
        horizontal: AppDimen.medium,
      ),
      child: Card(
        color: AppColors.primaryColorLight.lighten(.08),
        child: Padding(
          padding: const EdgeInsets.all(AppDimen.normal),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entity.name,
                    style: AppTextStyle.headlineWhite,
                  ),
                  const SizedBox(
                    height: AppDimen.medium,
                  ),
                  if (entity.forecast != null)
                    Row(
                      children: entity.forecast!
                          .map((e) => const ForeCastItemCard())
                          .toList(),
                    ),
                  if (entity.forecast == null)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.error,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: AppDimen.small,
                        ),
                        SizedBox(
                          child: Text(
                            'Unable to load forecast. Please try again later.',
                            style: AppTextStyle.body2,
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
