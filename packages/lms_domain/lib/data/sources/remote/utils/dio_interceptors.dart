import 'package:dio/dio.dart';

import '../exceptions.dart';

class AppInterceptors extends InterceptorsWrapper {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String? messageError =
        err.response?.data['status']?['message'] ?? err.toString();

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            err =
                BadRequestException(err.requestOptions, message: messageError);
            break;
          case 401:
            err = UnauthorizedException(err.requestOptions,
                message: messageError);
            break;
          case 404:
            err = NotFoundException(err.requestOptions, message: messageError);
            break;
          case 409:
            err = ConflictException(err.requestOptions, message: messageError);
            break;
          case 500:
            err = InternalServerErrorException(err.requestOptions,
                message: messageError);
            break;
        }
        break;
      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.unknown:
      case DioExceptionType.connectionError:
        err = NoInternetConnectionException(
          err.requestOptions,
          message: messageError,
        );
        break;
    }
    return handler.next(err);
  }
}
