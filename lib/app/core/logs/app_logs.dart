import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class AppLogs {
  static void makeRequestLog({required RequestOptions options}) {
    log('🟡 REQUEST CREATED:');
    log('| Request Options: ${options.headers}', name: 'HTTP');
    log('| METHOD: ${options.uri.path}', name: 'HTTP');
    log('| ENDPOINT API URL+PATH: ${options.uri}', name: 'HTTP');
    log('| BODY:  ${options.data}', name: 'HTTP');
    log('------------------------------------------------------------------------------------------------------------------------',
        name: '');
  }

  static void successRequestLog(Response response) {
    debugPrint('');
    log('✅ REQUEST SUCCESS:');
    log('| ENDPOINT: ${response.requestOptions.uri.path}', name: 'HTTP');
    log('| METHOD: ${response.requestOptions.method}', name: 'HTTP');
    log('| DATA: ${response.data.toString()}', name: 'HTTP');
    log('------------------------------------------------------------------------------------------------------------------------',
        name: '');
  }
}
