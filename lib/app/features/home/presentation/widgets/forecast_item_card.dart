import 'package:flutter/material.dart';
import 'package:weather_app/app/core/design/images/app_images.dart';
import 'package:weather_app/app/core/design/res/app_colors.dart';
import 'package:weather_app/app/core/design/res/dimen.dart';
import 'package:weather_app/app/core/design/styles/text_style.dart';

class ForeCastItemCard extends StatelessWidget {
  const ForeCastItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColorDark,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'MON',
              style: AppTextStyle.body2,
            ),
            const SizedBox(
              height: AppDimen.xxSmall,
            ),
            const Image(
              image: AppImages.midRain,
              height: 40,
              width: 40,
            ),
            const SizedBox(
              height: AppDimen.xxSmall,
            ),
            Text(
              '23º',
              style: AppTextStyle.body2,
            ),
          ],
        ),
      ),
    );
  }
}
