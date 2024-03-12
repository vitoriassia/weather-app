import 'package:flutter/foundation.dart';
import 'package:pokedex_app/app/core/services/api/errors/exception_handler_scope.dart';
import 'package:pokedex_app/app/core/services/api/response/data_wrapper_response.dart';
import 'package:pokedex_app/app/core/services/api_service.dart';
import 'package:pokedex_app/app/features/home/data/models/pokemon_model.dart';
import 'package:pokedex_app/app/features/home/domain/datasources/home_remote_data_source.dart';
import 'package:pokedex_app/app/features/home/domain/entities/pokemon_entity.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<PokemonEntity>> getListPokemons(int page) async {
    return remoteDataSourceExceptionHandlerScope<List<PokemonEntity>>(
      () async {
        int offset = getOffsetByPage(page);
        final response =
            await _apiService.getDataFrom('/pokemon/?limit=20&offset=$offset.');

        final data = DataWrapperResponse.fromJson(
            response.data['results'], response.statusCode);

        final listWithFullInformation =
            await _getListPokemonsWithFullInformation(data.result!);

        return listWithFullInformation;
      },
    );
  }

  int getOffsetByPage(int page) {
    if (page == 1) return 0;
    return page * 20;
  }

  Future<List<PokemonEntity>> _getListPokemonsWithFullInformation(
      List<dynamic> result) async {
    List<PokemonEntity> list = [];
    for (var simpleInfoPokemon in result) {
      try {
        final response =
            await _apiService.getDataWithFullUrl(simpleInfoPokemon['url']);
        final data =
            DataWrapperResponse.fromJson(response.data, response.statusCode);

        final PokemonEntity pokemonEntity = PokemonModel.fromJson(data.result);

        list.add(pokemonEntity);
      } catch (e) {
        if (kDebugMode) {
          debugPrint(e.toString());
        }
      }
    }
    return list;
  }
}
