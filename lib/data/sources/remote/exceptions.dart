import 'package:dio/dio.dart';

class BadRequestException extends DioException {
  final String? messageError;

  BadRequestException(RequestOptions r, {message})
      : messageError = message is String ? message : message[0],
        super(requestOptions: r);

  @override
  String toString() {
    return messageError != null ? messageError.toString() : 'Invalid document';
  }
}

class InternalServerErrorException extends DioException {
  final String? messageError;

  InternalServerErrorException(RequestOptions r, {message})
      : messageError = message is String ? message : message[0],
        super(requestOptions: r);

  @override
  String toString() {
    return messageError != null
        ? messageError.toString()
        : 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioException {
  final String? messageError;

  ConflictException(RequestOptions r, {message})
      : messageError = message is String ? message : message[0],
        super(requestOptions: r);

  @override
  String toString() {
    return messageError != null ? messageError.toString() : 'Conflict occurred';
  }
}

class UnauthorizedException extends DioException {
  final String? messageError;

  UnauthorizedException(RequestOptions r, {message})
      : messageError = message is String ? message : message[0],
        super(requestOptions: r);

  @override
  String toString() {
    return messageError != null ? messageError.toString() : 'Access denied';
  }
}

class NotFoundException extends DioException {
  final String? messageError;

  NotFoundException(RequestOptions r, {message})
      : messageError = message is String ? message : message[0],
        super(requestOptions: r);

  @override
  String toString() {
    return messageError != null
        ? messageError.toString()
        : 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioException {
  final String? messageError;

  NoInternetConnectionException(RequestOptions r, {message})
      : messageError =
            message != null ? (message is String ? message : message[0]) : null,
        super(requestOptions: r);

  @override
  String toString() {
    return messageError != null
        ? messageError.toString()
        : 'No internet connection detected, please try again';
  }
}

class DeadlineExceededException extends DioException {
  final String? messageError;

  DeadlineExceededException(RequestOptions r, {message})
      : messageError = message is String ? message : message[0],
        super(requestOptions: r);

  @override
  String toString() {
    return messageError != null
        ? messageError.toString()
        : 'The connection has timed out, please try again';
  }
}

class BadCertificateException extends DioException {
  final String? messageError;

  BadCertificateException(RequestOptions r, {message})
      : messageError = message is String ? message : message[0],
        super(requestOptions: r);

  @override
  String toString() {
    return messageError != null
        ? messageError.toString()
        : 'Bad certificate, please check it again';
  }
}

class DataException implements Exception {
  final int? statusCode;
  final String? status;
  final String? message;
  final dynamic error;

  DataException({this.statusCode, this.status, this.message, this.error});

  factory DataException.fromJson(Map<String, dynamic> json) => DataException(
      statusCode: json.containsKey("statusCode") ? json["statusCode"] : 0,
      status: json.containsKey("status") ? json["status"] : null,
      message: json.containsKey("message") ? json["message"] : null,
      error: json.containsKey("error") ? json["error"] : null);

  @override
  String toString() {
    return 'DataException{statusCode: $statusCode, status: $status, message: $message, error: $error}';
  }
}
