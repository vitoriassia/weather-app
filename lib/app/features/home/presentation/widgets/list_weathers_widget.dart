import 'package:flutter/cupertino.dart';
import 'package:weather_app/app/core/design/res/dimen.dart';
import 'package:weather_app/app/features/home/domain/entities/main_city_entity.dart';
import 'weather_card_widget.dart';

class ListMainCitiesWidget extends StatelessWidget {
  final List<MainCityEntity> mainCities;
  const ListMainCitiesWidget({super.key, required this.mainCities});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => const WeatherCardWidget(),
      separatorBuilder: (context, index) => const SizedBox(
        height: AppDimen.small,
      ),
      itemCount: mainCities.length + 4,
    );
  }
}
