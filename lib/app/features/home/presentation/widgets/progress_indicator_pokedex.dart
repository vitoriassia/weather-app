import 'package:flutter/material.dart';

import 'package:pokedex_app/app/core/design/res/dimen.dart';

class ProgressIndicatorPokedex extends StatelessWidget {
  const ProgressIndicatorPokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/loading.gif',
            width: 122,
          ),
          const SizedBox(
            height: PokedexDimen.medium,
          ),
        ],
      ),
    );
  }
}
