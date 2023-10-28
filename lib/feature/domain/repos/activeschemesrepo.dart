import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:turbosoft/core/api/endpoints.dart';
import 'package:turbosoft/core/failures/failures.dart';
import 'package:turbosoft/feature/data/models/customer_scheme_model/customer_scheme_model.dart';
import 'package:turbosoft/feature/data/repos/abstractrepos.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: IUserSchemes)
class ActiveSchemesRepo implements IUserSchemes {
  @override
  Future<Either<MainFailures, List<CustomerSchemeModel>>> getactiveSchemes(
      String datakey, String cusId) async {
    try {
      final response = await http.post(Uri.parse(baseurl + userschemesurl),
          body: {"datakey": datakey, "cusID": cusId});
      if (response.statusCode == 200) {
        // log(response.body);

        final Map<String, dynamic> json = jsonDecode(response.body);
        final List<dynamic> productData = json['result'];
        List<CustomerSchemeModel> schemes = productData
            .map<CustomerSchemeModel>(
                (json) => CustomerSchemeModel.fromJson(json))
            .toList();

        return right(schemes);
      } else {
        log(response.statusCode.toString());
        return left(const MainFailures.clientfailure());
      }
    } catch (e) {
      return left(const MainFailures.serverfailure());
    }
  }
}
