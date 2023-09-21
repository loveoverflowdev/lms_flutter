import 'package:equatable/equatable.dart';
import 'package:lms_customer_app/config/status/loading_status.dart';
import 'package:lms_domain/domain/entities/products/course.dart';

class CoursesInCartState extends Equatable {
  final LoadingStatus loadingStatus;
  final List<Course> courseList;
  final String message;
  final String accessToken;

  const CoursesInCartState({
    this.loadingStatus = LoadingStatus.pure,
    this.courseList = const [],
    this.message = '',
    this.accessToken = '',
  });

  CoursesInCartState copyWith({
    LoadingStatus? loadingStatus,
    List<Course>? courseList,
    String? message,
    String? accessToken,
  }) {
    return CoursesInCartState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      courseList: courseList ?? this.courseList,
      message: message ?? this.message,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  @override
  List<Object> get props => [loadingStatus, courseList, message];
}
