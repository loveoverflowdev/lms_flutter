import 'package:dartz/dartz.dart';
import 'package:lms_domain/data/models/products/data_course.dart';
import 'package:lms_domain/data/sources/remote/resources/api_uris.dart';
import 'package:lms_domain/domain/entities/products/course.dart';
import 'package:lms_domain/domain/repositories/cart/cart_repository.dart';

import '../../sources/remote/network_service_mixin.dart';

class CartRepositoryImpl with NetworkServiceMixin implements CartRepository {
  @override
  Future<Either<void, Exception>> addCourseByIdToCart(
    final String courseId, {
    required String accessToken,
  }) async {
    final response = await post(
      "${ApiUris.courseInCustomerCart}/$courseId",
      headers: {'Authorization': 'Bearer $accessToken'},
    );
    return response.bimap((l) => l, (r) => r);
  }

  @override
  Future<Either<List<Course>, Exception>> getCourseListInCart({
    required String accessToken,
  }) async {
    final response = await get(
      ApiUris.courseListInCustomerCart,
      headers: {'Authorization': 'Bearer $accessToken'},
    );
    return response.bimap(
      (l) => ((l['data'] ?? []) as List)
          .map((e) => DataCourse.fromMap(e).toEntity())
          .toList(),
      (r) => r,
    );
  }

  @override
  Future<Either<void, Exception>> removeCourseByIdFromCart(
    String courseId, {
    required String accessToken,
  }) async {
    final response = await delete(ApiUris.courseInCustomerCart);
    return response.bimap((l) => l, (r) => r);
  }
}
