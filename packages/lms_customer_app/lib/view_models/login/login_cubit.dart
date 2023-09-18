import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lms_domain/domain/use_cases/customer_use_cases.dart';

import '../../config/status/loading_status.dart';
import 'login_state.dart';

class LoginCubit extends HydratedCubit<LoginState> {
  final CustomerLoginUseCase _loginUseCase;

  LoginCubit({
    required final CustomerLoginUseCase loginUseCase,
  })  : _loginUseCase = loginUseCase,
        super(const LoginState());

  void changeUsernameOrEmail(String usernameOrEmail) {
    emit(state.copyWith(usernameOrEmail: usernameOrEmail));
  }

  void changePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void logIn() async {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));
    final result = await _loginUseCase.call(
      CustomerLoginParams(
          usernameOrEmail: state.usernameOrEmail, password: state.password),
    );
    result.fold(
      (l) => emit(state.copyWith(
        loginResult: l,
        loadingStatus: LoadingStatus.success,
      )),
      (r) => emit(state.copyWith(
        loadingStatus: LoadingStatus.error,
        message: r.toString(),
      )),
    );

    emit(state.copyWith(loadingStatus: LoadingStatus.finish));
  }

  @override
  LoginState? fromJson(Map<String, dynamic> json) {
    return LoginState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(LoginState state) {
    return state.toMap();
  }
}
