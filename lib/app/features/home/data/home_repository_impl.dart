import 'package:weather_app/app/features/home/domain/datasources/home_remote_data_source.dart';
import 'package:weather_app/app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);
}
