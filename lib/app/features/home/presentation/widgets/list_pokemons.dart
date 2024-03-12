import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/app/core/shared/presentation/ui_state.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/features/home/presentation/controllers/home_controller.dart';
import 'package:pokedex_app/app/features/home/presentation/widgets/pokemon_card/pokemon_card.dart';
import 'package:pokedex_app/app/features/paginated_list_view/data/pagination.dart';
import 'package:pokedex_app/app/features/paginated_list_view/presentation/paginated_list_view_widget.dart';
import 'package:pokedex_app/app/features/pokemon_detail/pokemon_detail_card.dart';
import 'package:pokedex_app/app/shared/presentation/show_dialog_with_scale_animation.dart';

class ListPokemons extends StatelessWidget {
  final HomeController homeController;
  const ListPokemons({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final state = homeController.uiState;

        if (state is Success<Pagination<PokemonEntity>>) {
          return PaginatedListViewWidget<PokemonEntity>(
            shrinkWrap: true,
            paginationState: state,
            isLoading: state is PaginationLoading,
            onLoadMorePressed: () async {
              homeController.loadingListPokemons(
                page: state.value.currentPage + 1,
              );
            },
            builder: (pokemon) => PokemonCard(
              pokemon,
              onPress: () => {
                showDialogWithScaleAnimation(
                    child: PokemonDetailCard(
                      pokemonEntity: pokemon,
                    ),
                    context: context)
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
