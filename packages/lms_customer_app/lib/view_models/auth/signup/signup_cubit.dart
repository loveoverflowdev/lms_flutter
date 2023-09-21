import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_domain/domain/use_cases/customer/auth/customer_signup_use_case.dart';

import '../../../config/status/loading_status.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final CustomerSignupUseCase _customerSignupUseCase;

  SignupCubit({
    required final CustomerSignupUseCase customerSignupUseCase,
  })  : _customerSignupUseCase = customerSignupUseCase,
        super(const SignupState());

  void changUsername(String username) {
    emit(state.copyWith(username: username));
  }

  void changePassword(String password) {
    emit(state.copyWith(
      password: password,
    ));
  }

  void changeRetypedPassword(String retypedPassword) {
    emit(state.copyWith(
      retypedPassword: retypedPassword,
    ));
  }

  void changeEmail(String email) {
    emit(state.copyWith(
      email: email,
    ));
  }

  void changeUsername(String username) {
    emit(state.copyWith(
      username: username,
    ));
  }

  void changePhoneNumber(String phoneNumber) {
    emit(state.copyWith(
      phoneNumber: phoneNumber,
    ));
  }

  Future<void> signUp() async {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));

    if (state.retypedPassword != state.password) {
      emit(state.copyWith(
        loadingStatus: LoadingStatus.error,
        message: 'Mật khẩu không khớp',
      ));
    } else {
      final result = await _customerSignupUseCase.call(
        CustomerSignupParams(
          username: state.email,
          phoneNumber: state.phoneNumber,
          email: state.email,
          password: state.password,
        ),
      );
      result.fold(
        (l) => emit(state.copyWith(
          loadingStatus: LoadingStatus.success,
          customer: l.customer,
        )),
        (r) => emit(state.copyWith(
          loadingStatus: LoadingStatus.error,
          message: r.toString(),
        )),
      );
    }

    emit(state.copyWith(loadingStatus: LoadingStatus.finish));
  }
}
