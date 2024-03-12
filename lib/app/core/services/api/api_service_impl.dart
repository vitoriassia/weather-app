import 'package:dio/dio.dart';
import 'package:pokedex_app/app/core/services/api/api_config.dart';
import 'package:pokedex_app/app/core/services/api/errors/exception_handler_scope.dart';
import 'package:pokedex_app/app/core/services/api/response/http_response.dart';
import 'package:pokedex_app/app/core/services/api_service.dart';

class ApiServiceImpl extends ApiService {
  final ApiConfig apiConfig;
  ApiServiceImpl({
    required this.apiConfig,
  });

  @override
  Future<HttpResponse> postDataTo(String endpoint, data) async {
    return apiServiceExceptionHandlerScope(
      () async {
        final response = await apiConfig.dio.post(endpoint, data: data);
        return HttpResponse(
            statusCode: response.statusCode, data: response.data);
      },
    );
  }

  @override
  Future<HttpResponse> putDataTo(String endpoint, data) async {
    return apiServiceExceptionHandlerScope(
      () async {
        final response = await apiConfig.dio.put(endpoint, data: data);

        return HttpResponse(
            statusCode: response.statusCode, data: response.data);
      },
    );
  }

  @override
  Future<HttpResponse> getDataFrom(String endpoint) async {
    return apiServiceExceptionHandlerScope(
      () async {
        final response = await apiConfig.dio.get(endpoint);
        return HttpResponse(
            statusCode: response.statusCode, data: response.data);
      },
    );
  }

  @override
  Future<HttpResponse> getDataWithFullUrl(String ur) {
    return apiServiceExceptionHandlerScope(
      () async {
        final response = await Dio().get(ur);
        return HttpResponse(
            statusCode: response.statusCode, data: response.data);
      },
    );
  }
}
