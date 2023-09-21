import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'resources/api_uris.dart';
import 'utils/dio_interceptors.dart';

class RestClient {
  final _timeout = const Duration(milliseconds: 15000);
  late Map<String, dynamic> _headers;

  /// Client Shared Instance
  static final RestClient _instance = RestClient._internal();

  late final Dio _dio;

  factory RestClient() {
    return _instance;
  }

  RestClient._internal() {
    _headers = {};
    _dio = Dio(_getDioBaseOption());

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        responseBody: false,
      ));
      _dio.interceptors.add(AppInterceptors(_dio));
    }
  }

  Dio getDio() {
    return _dio;
  }

  BaseOptions _getDioBaseOption() {
    return BaseOptions(
      baseUrl: ApiUris.base,
      connectTimeout: _timeout,
      receiveTimeout: _timeout,
      contentType: 'application/json',
      headers: _headers,
      responseType: ResponseType.json,
    );
  }
}
