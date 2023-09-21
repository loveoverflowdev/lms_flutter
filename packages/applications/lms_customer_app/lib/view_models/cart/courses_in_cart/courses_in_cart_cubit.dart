import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_customer_app/config/status/loading_status.dart';
import 'package:lms_customer_app/config/texts/localized_texts.dart';

import 'courses_in_cart_state.dart';
import 'package:lms_domain/domain/use_cases/customer/cart/get_course_list_in_cart_use_case.dart';
import 'package:lms_domain/domain/use_cases/customer/cart/add_course_to_cart_use_case.dart';
import 'package:lms_domain/domain/use_cases/customer/cart/remove_course_from_cart_use_case.dart';

class CoursesInCartCubit extends Cubit<CoursesInCartState> {
  final GetCourseListInCartUseCase _getCourseListInCartUseCase;
  final AddCourseToCartUseCase _addCourseToCartUseCase;
  final RemoveCourseFromCartUseCase _removeCourseFromCartUseCase;

  CoursesInCartCubit({
    required final GetCourseListInCartUseCase getCourseListInCartUseCase,
    required final AddCourseToCartUseCase addCourseToCartUseCase,
    required final RemoveCourseFromCartUseCase removeCourseFromCartUseCase,
  })  : _getCourseListInCartUseCase = getCourseListInCartUseCase,
        _addCourseToCartUseCase = addCourseToCartUseCase,
        _removeCourseFromCartUseCase = removeCourseFromCartUseCase,
        super(const CoursesInCartState());

  void setAccessToken(String token) {
    emit(state.copyWith(accessToken: token));
  }

  Future<void> loadCourseList() async {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));

    final result = await _getCourseListInCartUseCase
        .call(GetCourseListInCartParams(accessToken: state.accessToken));
    result.fold((l) {
      emit(state.copyWith(
        courseList: l,
        loadingStatus: LoadingStatus.success,
      ));
    }, (r) {
      emit(state.copyWith(
        message: r.toString(),
        loadingStatus: LoadingStatus.error,
      ));
    });

    emit(state.copyWith(loadingStatus: LoadingStatus.finish));
  }

  Future<void> addCourseByIdToCart(String id) async {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));

    final result = await _addCourseToCartUseCase.call(
      AddCourseToCartParams(courseId: id, accessToken: state.accessToken),
    );
    result.fold(
      (l) {
        emit(state.copyWith(
          loadingStatus: LoadingStatus.success,
          message: LocalizedTexts.addToCartSuccess,
        ));

        _reloadCourseList();
      },
      (r) => emit(state.copyWith(
        loadingStatus: LoadingStatus.error,
        message: r.toString(),
      )),
    );

    emit(state.copyWith(loadingStatus: LoadingStatus.finish));
  }

  Future<void> removeCourseByIdFromCart(String id) async {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));

    final result = await _removeCourseFromCartUseCase.call(
      RemoveCourseFromCartParams(courseId: id, accessToken: state.accessToken),
    );
    result.fold(
      (l) {
        emit(state.copyWith(
          loadingStatus: LoadingStatus.success,
          message: LocalizedTexts.addToCartSuccess,
        ));

        _reloadCourseList();
      },
      (r) => emit(state.copyWith(
        loadingStatus: LoadingStatus.error,
        message: r.toString(),
      )),
    );

    emit(state.copyWith(loadingStatus: LoadingStatus.finish));
  }

  void _reloadCourseList() {
    EasyDebounce.debounce(
      '_reload_course_after_modifying',
      const Duration(milliseconds: 1500),
      () {
        loadCourseList();
      },
    );
  }
}
