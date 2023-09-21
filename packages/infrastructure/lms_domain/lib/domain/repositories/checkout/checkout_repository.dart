import 'package:dartz/dartz.dart';

abstract class CheckoutRepository {
  Future<Either<void, Exception>> buyCourseBydId(String courseId);
  Future<Either<void, Exception>> buyCourseGroupById(String courseGroupid);

  Future<Either<void, Exception>> buyCourseList({required List<String> idList});
  Future<Either<void, Exception>> buyCourseGroupList({
    required List<String> idList,
  });
}
