import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;
import 'package:pokedex_app/app/core/services/api/errors/exceptions.dart';
import 'package:pokedex_app/app/core/services/api/errors/failures.dart';
import 'package:pokedex_app/app/core/services/api/response/error_response.dart';

Future<Either<Failure, T>> repositoryExceptionHandlerScope<T>(
    Function function) async {
  try {
    return Right(await function());
  } on ClientException catch (e) {
    return Left(
      ServerFailure(
        message: e.errorResponse?.message,
        errorResponse: e.errorResponse,
      ),
    );
  } on ServerException catch (e) {
    return Left(
      ServerFailure(
        message: e.message,
      ),
    );
  } on DataBaseException catch (e) {
    return Left(
      DataBaseFailure(
        e.message,
      ),
    );
  }
}

Future<T> remoteDataSourceExceptionHandlerScope<T>(Function function) async {
  try {
    return await function();
  } on HttpResponseException catch (e) {
    if (e.data != null || (e.statusCode >= 400 && e.statusCode <= 499)) {
      throw ClientException(
        statusCode: e.statusCode,
        errorResponse: e.data != null &&
                (e.data is Map<String, dynamic> || e.data is String)
            ? ErrorResponse.fromJson(
                e.data,
                e.statusCode,
              )
            : null,
      );
    } else {
      throw ServerException(
        statusCode: e.statusCode,
        message: e.error?.toString(),
      );
    }
  }
}

Future<T> localDataSourceExceptionHandlerScope<T>(Function function) async {
  try {
    return await function();
  } catch (e) {
    developer.log(
      e.toString(),
      name: 'DATABASE ERROR:',
    );
    throw const DataBaseException(
        message: 'Não foi possivel executar essa ação no banco de dados ');
  }
}

Future<T> apiServiceExceptionHandlerScope<T>(Function function) async {
  try {
    return await function();
  } on DioError catch (e) {
    if (e.response != null) {
      final response = e.response!;

      throw HttpResponseException(
          statusCode: response.statusCode ?? 400, data: response.data);
    } else {
      throw HttpResponseException(statusCode: 500, error: e.error);
    }
  } on Exception catch (e) {
    if (kDebugMode) {
      developer.log(
        e.toString(),
        name: 'API SERVICE EXCEPTION HANDLER',
      );
    }
    throw HttpResponseException(statusCode: 500, error: e.toString());
  }
}
