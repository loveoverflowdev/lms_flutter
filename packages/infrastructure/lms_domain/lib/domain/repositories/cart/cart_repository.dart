import 'package:dartz/dartz.dart';

import '../../entities/products/course.dart';

abstract class CartRepository {
  Future<Either<void, Exception>> addCourseByIdToCart(
    final String courseId, {
    required String accessToken,
  });
  Future<Either<void, Exception>> removeCourseByIdFromCart(
    final String courseId, {
    required String accessToken,
  });
  Future<Either<List<Course>, Exception>> getCourseListInCart({
    required final String accessToken,
  });
}
