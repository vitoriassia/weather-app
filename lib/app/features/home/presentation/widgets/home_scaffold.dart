import 'package:flutter/material.dart';
import 'package:weather_app/app/core/design/res/app_colors.dart';
import 'package:weather_app/app/core/design/styles/text_style.dart';

class HomeScaffold extends StatelessWidget {
  final Widget body;
  final TabBar tabBar;
  const HomeScaffold({
    super.key,
    required this.body,
    required this.tabBar,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                'Weather App',
                style: AppTextStyle.headline,
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          bottom: TabBar(
            padding: const EdgeInsets.all(10),
            dividerHeight: 0,
            splashBorderRadius: BorderRadius.circular(10),
            indicatorColor: Colors.white,
            indicator: BoxDecoration(
              color: AppColors.primaryColorDark,
              borderRadius: BorderRadius.circular(10),
            ),
            tabs: [
              Tab(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Weather', style: AppTextStyle.headlineWhite3),
                ),
              ),
              Tab(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Forecast', style: AppTextStyle.headlineWhite3),
                ),
              ),
            ],
          ),
          elevation: 0,
        ),
        body: SafeArea(
          child: body,
        ),
      ),
    );
  }
}
