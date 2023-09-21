import 'package:dartz/dartz.dart';
import 'package:lms_domain/core/use_case/use_case.dart';
import 'package:lms_domain/domain/repositories/cart/cart_repository.dart';

class AddCourseToCartParams {
  final String courseId;
  final String accessToken;

  AddCourseToCartParams({
    required this.courseId,
    required this.accessToken,
  });
}

class AddCourseToCartUseCase extends UseCase<void, AddCourseToCartParams> {
  final CartRepository _cartRepository;

  AddCourseToCartUseCase({
    required final CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<Either<void, Exception>> call(AddCourseToCartParams params) async {
    final result = await _cartRepository.addCourseByIdToCart(
      params.courseId,
      accessToken: params.accessToken,
    );
    return result;
  }
}
