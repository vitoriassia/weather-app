import 'package:weather_app/app/core/services/api_service.dart';
import 'package:weather_app/app/features/home/domain/datasources/home_remote_data_source.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);
}
