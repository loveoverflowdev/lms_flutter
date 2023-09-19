import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_domain/domain/use_cases/customer_use_cases.dart';

import '../../../config/status/loading_status.dart';
import 'course_detail_state.dart';

class CourseDetailCubit extends Cubit<CourseDetailState> {
  final GetCourseDetailUseCase _getCourseDetailUseCase;

  CourseDetailCubit({
    required final GetCourseDetailUseCase getCourseDetailUseCase,
  })  : _getCourseDetailUseCase = getCourseDetailUseCase,
        super(const CourseDetailState());

  Future<void> loadCourse(String id) async {
    emit(state.copyWith(
      loadingStatus: LoadingStatus.loading,
    ));
    final result =
        await _getCourseDetailUseCase.call(GetCourseDetailParams(id: id));

    result.fold(
      (l) => emit(state.copyWith(
        loadingStatus: LoadingStatus.success,
        course: l,
      )),
      (r) => emit(
        state.copyWith(
          loadingStatus: LoadingStatus.error,
          message: r.toString(),
        ),
      ),
    );
    emit(
      state.copyWith(loadingStatus: LoadingStatus.finish),
    );
  }
}
