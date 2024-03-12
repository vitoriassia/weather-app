import 'package:flutter/material.dart';

import 'package:pokedex_app/app/core/design/images/app_images.dart';
import 'package:pokedex_app/app/core/design/res/app_colors.dart';
import 'package:pokedex_app/app/core/design/res/dimen.dart';
import 'package:pokedex_app/app/core/design/styles/text_style.dart';

class HomeScaffold extends StatelessWidget {
  final Widget body;
  final TabBar tabBar;
  const HomeScaffold({
    Key? key,
    required this.body,
    required this.tabBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Column(
            children: [
              Text('Pokedex', style: PokedexTextStyle.headlineWhite),
            ],
          ),
          centerTitle: true,
          backgroundColor: AppColors.redPokedexColor,
          bottom: TabBar(
            splashBorderRadius: BorderRadius.circular(10),
            indicatorColor: Colors.white,
            indicatorPadding: const EdgeInsets.all(PokedexDimen.xxSmall),
            indicator: BoxDecoration(
                color: const Color.fromARGB(255, 162, 6, 47),
                borderRadius: BorderRadius.circular(10)),
            tabs: [
              Tab(
                child: Text('POKÉMONS', style: PokedexTextStyle.headlineWhite3),
              ),
              Tab(
                child: Text('CUSTOM POKÉMONS',
                    style: PokedexTextStyle.headlineWhite3),
              ),
            ],
          ),
          elevation: 0,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: AppImages.pokeball,
              color: Colors.grey.withOpacity(0.2),
            ),
            SafeArea(
              child: body,
            )
          ],
        ),
      ),
    );
  }
}
