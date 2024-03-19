import 'package:flutter/cupertino.dart';
import 'package:weather_app/app/core/design/res/dimen.dart';
import 'package:weather_app/app/features/home/domain/entities/main_city_entity.dart';
import 'package:weather_app/app/features/home/presentation/widgets/forecast_card_widget.dart';

class ListForecastWidget extends StatelessWidget {
  final List<MainCityEntity> mainCities;
  const ListForecastWidget({super.key, required this.mainCities});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => ForecastCardWidget(
        entity: mainCities[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: AppDimen.small,
      ),
      itemCount: mainCities.length,
    );
  }
}
