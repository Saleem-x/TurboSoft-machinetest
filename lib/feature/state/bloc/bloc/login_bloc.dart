import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:turbosoft/core/failures/failures.dart';
import 'package:turbosoft/feature/auth/authrepo.dart';
import 'package:turbosoft/feature/data/models/login_model/login_model.dart';
import 'package:turbosoft/feature/data/models/uset_base_model/uset_base_model.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<UserLoginEvent>((event, emit) async {
      emit(const Loadingstate());
      Either<MainFailures, UsetBaseModel> logistatus =
          await LoginRepo().login(event.user);

      emit(logistatus.fold((l) {
        return l.when(
          clientfailure: () => const Failedstate(),
          serverfailure: () => const Failedstate(),
          networkerror: (error) => Exceptionalstate(message: error),
        );
      }, (r) => Successstate(user: r)));
    });
  }
}
