import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_domain/data/repositories/products/course_repository_impl.dart';

import '../../../config/status/loading_status.dart';
import 'top_course_list_state.dart';

class TopCourseListCubit extends Cubit<TopCourseListState> {
  late final _courseRepository = CourseRepositoryImpl();

  TopCourseListCubit() : super(const TopCourseListState());

  void loadCourseList() async {
    emit(state.copyWith(
      loadingStatus: LoadingStatus.loading,
    ));
    final result = await _courseRepository.getCourseListOnTop();
    result.fold(
      (l) => emit(state.copyWith(
        loadingStatus: LoadingStatus.success,
        courseList: l,
      )),
      (r) => emit(state.copyWith(
        loadingStatus: LoadingStatus.error,
        message: r.toString(),
      )),
    );
    emit(state.copyWith(
      loadingStatus: LoadingStatus.finish,
    ));
  }
}
