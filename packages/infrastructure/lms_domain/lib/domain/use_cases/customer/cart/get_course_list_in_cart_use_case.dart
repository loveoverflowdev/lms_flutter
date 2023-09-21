import 'package:dartz/dartz.dart';
import 'package:lms_domain/core/use_case/use_case.dart';

import '../../../entities/products/course.dart';
import '../../../repositories/cart/cart_repository.dart';

class GetCourseListInCartParams {
  final String accessToken;
  GetCourseListInCartParams({
    required this.accessToken,
  });
}

class GetCourseListInCartUseCase
    implements UseCase<List<Course>, GetCourseListInCartParams> {
  final CartRepository _cartRepository;

  GetCourseListInCartUseCase({
    required final CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<Either<List<Course>, Exception>> call(
      GetCourseListInCartParams params) {
    return _cartRepository.getCourseListInCart(accessToken: params.accessToken);
  }
}
