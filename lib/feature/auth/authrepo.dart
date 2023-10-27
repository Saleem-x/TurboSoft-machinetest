import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbosoft/core/api/endpoints.dart';
import 'package:turbosoft/core/failures/failures.dart';
import 'package:turbosoft/feature/data/models/login_model/login_model.dart';
import 'package:turbosoft/feature/data/models/uset_base_model/uset_base_model.dart';

class LoginRepo {
  Future<Either<MainFailures, UsetBaseModel>> login(LoginModel user) async {
    try {
      final response = await http.post(
        Uri.parse(baseurl + loginurl),
        body: user.toJson(),
      );
      if (response.statusCode == 200) {
        log(response.body);
        final Map<String, dynamic> json = jsonDecode(response.body);

        final user = UsetBaseModel.fromJson(json['result'][0]);
        if (user.cusName == null) {
          return left(
              const MainFailures.networkerror(error: 'invalid credentials'));
        }
        final sharedprefs = await SharedPreferences.getInstance();
        await sharedprefs.clear();
        await sharedprefs.setString('user', response.body);

        log('${user.cusState}');

        return right(user);
      } else {
        // Map<String, dynamic> responseMap = jsonDecode(response.body);

        // String message = responseMap['message'].toString();
        log(response.body);
        log(response.statusCode.toString());
        return left(const MainFailures.networkerror(error: 'error'));
      }
    } catch (e) {
      log('error-> $e');
      return left(const MainFailures.clientfailure());
    }
  }
}
