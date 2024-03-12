import 'package:get/get.dart';
import 'package:pokedex_app/app/core/shared/presentation/message_to_failure_converter/failure_to_message_converter_factory.dart';
import 'package:pokedex_app/app/core/shared/presentation/ui_state.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/features/home/domain/useCases/get_list_assets_use_case.dart';
import 'package:pokedex_app/app/features/paginated_list_view/data/pagination.dart';

class HomeController extends GetxController {
  // --- USECASES --- //
  final GetListPokemonsUseCase _getListPokemonsUseCase;
  HomeController(
    this._getListPokemonsUseCase,
  );

  // -- ATRIBUTES --- //
  final RxList<PokemonEntity> _listPokemons = <PokemonEntity>[].obs;
  RxList<PokemonEntity> get listPokemons => _listPokemons;

  final Rx<UiState> _uiState = Rx<UiState>(Initial());
  UiState get uiState => _uiState.value;

  final _pagination = Pagination<PokemonEntity>.initial();

  // -- ACTIONS --- //
  Future<void> loadingListPokemons({required int page}) async {
    if (page > 1) {
      _uiState.value = PaginationLoading(_pagination);
    } else {
      _uiState.value = Loading();
    }

    final result =
        await _getListPokemonsUseCase(GetListPokemonsParams(page: page));

    _uiState.value = result.fold(
      (failure) {
        if (page <= 1) {
          return ErrorState(
            converter: FailureToMessageConverterFactory(failure)(),
            failure: failure,
          );
        }

        return PaginationError(
          _pagination,
          converter: FailureToMessageConverterFactory(failure)(),
          failure: failure,
        );
      },
      (successValue) {
        return Success(_pagination..refresh(list: successValue, page: page));
      },
    );
  }
}
