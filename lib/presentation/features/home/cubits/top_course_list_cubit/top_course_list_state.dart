// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../../../domain/entities/products/course.dart';
import '../../../../config/status/loading_status.dart';

class TopCourseListState extends Equatable {
  final LoadingStatus loadingStatus;
  final List<Course> courseList;
  final String message;

  const TopCourseListState({
    this.loadingStatus = LoadingStatus.pure,
    this.courseList = const [],
    this.message = '',
  });

  TopCourseListState copyWith({
    LoadingStatus? loadingStatus,
    List<Course>? courseList,
    String? message,
  }) {
    return TopCourseListState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      courseList: courseList ?? this.courseList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [loadingStatus, courseList, message];
}
