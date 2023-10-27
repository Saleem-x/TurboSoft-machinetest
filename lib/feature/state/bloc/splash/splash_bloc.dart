import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbosoft/feature/data/models/uset_base_model/uset_base_model.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState.initial()) {
    on<SplashEvent>((event, emit) async {
      final sharedprefs = await SharedPreferences.getInstance();
      final message = sharedprefs.getString('user');

      if (message == null || message.isEmpty) {
        await Future.delayed(const Duration(seconds: 3), () {
          return emit(const UsernotinState());
        });
      } else {
        final Map<String, dynamic> json = jsonDecode(message);

        final user = UsetBaseModel.fromJson(json['result'][0]);
        await Future.delayed(const Duration(seconds: 3), () {
          return emit(UserinState(user: user));
        });
      }
    });
  }
}
