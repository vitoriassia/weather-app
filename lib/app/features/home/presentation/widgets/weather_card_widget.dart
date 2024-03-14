import 'package:flutter/material.dart';
import 'package:weather_app/app/core/design/images/app_images.dart';
import 'package:weather_app/app/core/design/res/app_colors.dart';
import 'package:weather_app/app/core/design/res/dimen.dart';
import 'package:weather_app/app/core/design/styles/text_style.dart';
import 'package:weather_app/app/core/extension/color_extension.dart';

class WeatherCardWidget extends StatelessWidget {
  const WeatherCardWidget({super.key});

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
                    '23º',
                    style: AppTextStyle.headlineWhite,
                  ),
                  const SizedBox(
                    height: AppDimen.medium,
                  ),
                  Text(
                    'H:13º L:18º',
                    style: AppTextStyle.subtitle1,
                  ),
                  Text(
                    'Silverstone, UK',
                    style: AppTextStyle.body,
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
                    'Mid Rain',
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
