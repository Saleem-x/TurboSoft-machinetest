part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initialstate() = Initialstate;

  const factory LoginState.successstate({required UsetBaseModel user}) =
      Successstate;
  const factory LoginState.failedstate() = Failedstate;
  const factory LoginState.exceptionalstate({required String message}) =
      Exceptionalstate;
  const factory LoginState.loadingstate() = Loadingstate;

  factory LoginState.initial() => const LoginState.initialstate();
}
