import 'package:flutter/material.dart';
import 'package:weather_app/app/core/design/res/app_colors.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
