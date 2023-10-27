part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.userinstate({required UsetBaseModel user}) =
      UserinState;
  const factory SplashState.usernotinState() = UsernotinState;

  factory SplashState.initial() => const UsernotinState();
}
