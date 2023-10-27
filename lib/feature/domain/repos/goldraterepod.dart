import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:turbosoft/core/api/endpoints.dart';
import 'package:turbosoft/core/failures/failures.dart';
import 'package:turbosoft/feature/data/models/gold_rate_model/gold_rate_model.dart';
import 'package:turbosoft/feature/data/repos/abstractrepos.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: IGoldRateRepo)
class GoldRateRepo implements IGoldRateRepo {
  @override
  Future<Either<MainFailures, GoldRateModel>> getGoldrate(
      String datakey) async {
    try {
      final response = await http
          .post(Uri.parse(baseurl + goldrateurl), body: {"datakey": datakey});
      if (response.statusCode == 200) {
        // log(response.body);
        final Map<String, dynamic> json = jsonDecode(response.body);

        final goldrate = GoldRateModel.fromJson(json['result'][0]);

        // log(response.statusCode.toString());

        return right(goldrate);
      } else {
        log(response.statusCode.toString());
        return left(const MainFailures.clientfailure());
      }
    } catch (e) {
      return left(const MainFailures.serverfailure());
    }
  }
}
