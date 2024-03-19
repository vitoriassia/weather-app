import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;

import 'package:weather_app/app/core/logs/app_logs.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      AppLogs.makeRequestLog(options: options);
    }

    // access token is not necessary or allowed for public resources
    if (!options.headers.containsKey('Skip-Authorization')) {
      options.headers['Authorization'] = 'Bearer ';
    }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      AppLogs.successRequestLog(response);
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      developer.log(
        "URL:"
        '${err.requestOptions.baseUrl}${err.requestOptions.path} '
        '\n DATA:${err.response?.data?.toString()}',
        name: 'ERROR (${err.response?.statusCode}) ',
      );
    }

    // if response is 401 Unauthorized then force logout
    // if (err.response?.statusCode == HttpStatus.unauthorized) {
    //   await userSession.logout(
    //     afterLogout: () => Modular.to.navigate('/authentication'),
    //   );
    // }

    return super.onError(err, handler);
  }
}
