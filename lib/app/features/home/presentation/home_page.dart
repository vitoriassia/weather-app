import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/core/binds/binds_helper.dart';
import 'package:weather_app/app/core/shared/presentation/ui_state.dart';
import 'package:weather_app/app/features/home/presentation/controllers/home_controller.dart';
import 'package:weather_app/app/features/home/presentation/widgets/home_scaffold.dart';
import 'package:weather_app/app/features/home/presentation/widgets/app_progress_indicator.dart';
import 'package:weather_app/app/features/home/presentation/widgets/list_forecast_widget.dart';
import 'widgets/list_weathers_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = BindsHelper.get<HomeController>();
  @override
  void initState() {
    _controller.getListCitiesWithWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      tabBar: const TabBar(
        tabs: [
          Tab(icon: Icon(Icons.directions_car)),
          Tab(icon: Icon(Icons.directions_transit)),
          Tab(icon: Icon(Icons.directions_bike)),
        ],
      ),
      body: GetX<HomeController>(
        init: _controller,
        builder: (controller) {
          if (controller.uiState is Loading) {
            return const AppProgressIndicator();
          }

          if (controller.uiState is ErrorState) {
            final state = controller.uiState as ErrorState;
            return Center(
              child: Text(state.message),
            );
          }

          return TabBarView(
            children: [
              ListMainCitiesWidget(
                mainCities: controller.listCitiesWithWeather,
              ),
              ListForecastWidget(
                mainCities: controller.listCitiesWithWeather,
              ),
            ],
          );
        },
      ),
    );
  }
}
