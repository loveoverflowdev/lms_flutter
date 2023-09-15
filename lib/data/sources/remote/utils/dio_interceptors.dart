import 'package:dio/dio.dart';

import '../exceptions.dart';

class AppInterceptors extends InterceptorsWrapper {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String messageError = err.toString();

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions,
                message: messageError);
          case 401:
            throw UnauthorizedException(err.requestOptions,
                message: messageError);
          case 404:
            throw NotFoundException(err.requestOptions, message: messageError);
          case 409:
            throw ConflictException(err.requestOptions, message: messageError);
          case 500:
            throw InternalServerErrorException(err.requestOptions,
                message: messageError);
        }
        break;
      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.unknown:
      case DioExceptionType.connectionError:
        throw NoInternetConnectionException(
          err.requestOptions,
          message: messageError,
        );
    }
    return handler.next(err);
  }
}
