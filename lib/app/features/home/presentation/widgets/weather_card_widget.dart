import 'package:flutter/material.dart';
import 'package:weather_app/app/core/design/images/app_images.dart';
import 'package:weather_app/app/core/design/res/app_colors.dart';
import 'package:weather_app/app/core/design/res/dimen.dart';
import 'package:weather_app/app/core/design/styles/text_style.dart';
import 'package:weather_app/app/core/extension/color_extension.dart';
import 'package:weather_app/app/features/home/domain/entities/main_city_entity.dart';

class WeatherCardWidget extends StatelessWidget {
  final MainCityEntity entity;
  const WeatherCardWidget({super.key, required this.entity});

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
                    '${entity.currentWeather!.temp}º',
                    style: AppTextStyle.headline2White,
                  ),
                  const SizedBox(
                    height: AppDimen.medium,
                  ),
                  Text(
                    'H:${entity.currentWeather!.maxTemp}º L:${entity.currentWeather!.minTemp}º',
                    style: AppTextStyle.subtitle1,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      entity.name,
                      style: AppTextStyle.body,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(
                    image: AppImages.midRain,
                    height: 100,
                    width: 110,
                  ),
                  const SizedBox(
                    height: AppDimen.normal,
                  ),
                  Text(
                    entity.currentWeather!.weather,
                    style: AppTextStyle.body,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
