import 'package:dartz/dartz.dart';
import 'package:lms_domain/core/use_case/use_case.dart';
import 'package:lms_domain/domain/repositories/cart/cart_repository.dart';

class RemoveCourseFromCartParams {
  final String courseId;
  final String accessToken;

  RemoveCourseFromCartParams({
    required this.courseId,
    required this.accessToken,
  });
}

class RemoveCourseFromCartUseCase
    extends UseCase<void, RemoveCourseFromCartParams> {
  final CartRepository _cartRepository;

  RemoveCourseFromCartUseCase({
    required final CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<Either<void, Exception>> call(
      RemoveCourseFromCartParams params) async {
    final result = await _cartRepository.removeCourseByIdFromCart(
      params.courseId,
      accessToken: params.accessToken,
    );
    return result;
  }
}
