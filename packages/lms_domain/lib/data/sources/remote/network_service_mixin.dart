import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import 'rest_client.dart';

mixin NetworkServiceMixin {
  late final _logger = kDebugMode ? Logger() : null;

  Future<Either> get(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    final response = RestClient().getDio().get(
          path,
          queryParameters: params,
          options: headers != null ? Options(headers: headers) : null,
        );
    return _handleResponse(response);
  }

  Future<Either> post(
    String path, {
    Map<String, dynamic>? data,
    bool enableCache = false,
    Map<String, dynamic>? headers,
  }) async {
    final response = RestClient().getDio().post(
          path,
          data: data,
          options: headers != null ? Options(headers: headers) : null,
        );
    return _handleResponse(response);
  }

  // Future<Either> upload(
  //   String path, {
  //   required File file,
  //   bool enableCache = false,
  //
  // }) async {
  //   final fileName = file.path.split('/').last;
  //   FormData formData = FormData.fromMap({
  //     "image_upload":
  //         await MultipartFile.fromFile(file.path, filename: fileName),
  //   });
  //   final response =
  //       RestClient().getDio().post(path, data: formData);
  //   return _handleResponse(response);
  // }

  Future<Either> put(
    String path, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
  }) async {
    final response = RestClient().getDio().put(
          path,
          data: data,
          options: headers != null ? Options(headers: headers) : null,
        );
    return _handleResponse(response);
  }

  Future<Either> delete(
    String path, {
    Map<String, dynamic>? headers,
  }) async {
    final response = RestClient().getDio().delete(
          path,
          options: headers != null ? Options(headers: headers) : null,
        );
    return _handleResponse(response);
  }

  Future<Either> postUpload(
    String path, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? headers,
  }) async {
    final response = RestClient().getDio().post(
          path,
          data: data,
          options: headers != null ? Options(headers: headers) : null,
        );
    return _handleResponse(response);
  }

  bool isSuccess(Response<dynamic> response) =>
      response.statusCode != null &&
      response.statusCode! >= 200 &&
      response.statusCode! <= 299;

  Future<Either<dynamic, HttpException>> _handleResponse(
    Future<dio.Response> futureResponse,
  ) async {
    try {
      final response = await futureResponse;
      _logger?.d('_handleResponse::$response');

      if (isSuccess(response)) {
        return Left(response.data);
      } else {
        _logger?.e('DataException: ${response.data}');
        final String? errorResponsedMessage =
            response.data['status']?['message'];
        return Right(
          HttpException(
            errorResponsedMessage ?? response.data.toString(),
          ),
        );
      }
    } catch (error) {
      _logger?.e('Exception: ${error.toString()}');
      final errorStr = (error is DioException
          ? error.message ?? error.toString()
          : error.toString());
      return Right(HttpException(errorStr));
    }
  }
}
