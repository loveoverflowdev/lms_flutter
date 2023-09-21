// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:lms_customer_app/config/status/loading_status.dart';
import 'package:lms_domain/domain/entities/products/course.dart';

class CourseDetailState extends Equatable {
  final LoadingStatus loadingStatus;
  final String message;
  final Course? course;

  const CourseDetailState({
    this.loadingStatus = LoadingStatus.pure,
    this.message = '',
    this.course,
  });

  CourseDetailState copyWith({
    LoadingStatus? loadingStatus,
    String? message,
    Course? course,
  }) {
    return CourseDetailState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      message: message ?? this.message,
      course: course ?? this.course,
    );
  }

  @override
  List<Object?> get props => [loadingStatus, message, course];
}
