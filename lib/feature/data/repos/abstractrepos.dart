import 'package:dartz/dartz.dart';
import 'package:turbosoft/core/failures/failures.dart';
import 'package:turbosoft/feature/data/models/customer_scheme_model/customer_scheme_model.dart';
import 'package:turbosoft/feature/data/models/gold_rate_model/gold_rate_model.dart';
import 'package:turbosoft/feature/data/models/scheme_details_model/scheme_details_model.dart';

abstract class IGoldRateRepo {
  Future<Either<MainFailures, GoldRateModel>> getGoldrate(String datakey);
}

abstract class IUserSchemes {
  Future<Either<MainFailures, List<CustomerSchemeModel>>> getactiveSchemes(
      String datakey, String cusId);
}

abstract class ISchemeDetails {
  Future<Either<MainFailures, SchemeDetailsModel>> getSchemeDetails(
      String datakey, String cusId, String schmid);
}
