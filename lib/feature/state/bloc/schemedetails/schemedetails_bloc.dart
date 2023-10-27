import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:turbosoft/core/failures/failures.dart';
import 'package:turbosoft/feature/data/models/customer_scheme_model/customer_scheme_model.dart';
import 'package:turbosoft/feature/data/models/scheme_details_model/scheme_details_model.dart';
import 'package:turbosoft/feature/data/repos/abstractrepos.dart';

part 'schemedetails_event.dart';
part 'schemedetails_state.dart';
part 'schemedetails_bloc.freezed.dart';

@injectable
class SchemedetailsBloc extends Bloc<SchemedetailsEvent, SchemedetailsState> {
  final ISchemeDetails schemeDetails;
  SchemedetailsBloc(this.schemeDetails) : super(SchemedetailsState.initial()) {
    on<GetschemedetailsEvent>((event, emit) async {
      Either<MainFailures, SchemeDetailsModel> goldrate = await schemeDetails
          .getSchemeDetails(event.datakeys, event.cusid, event.schmId);

      emit(goldrate.fold((l) => SchemedetailsState.initial(),
          (r) => Schemedetailsstate(schemedetail: r, scheme: event.scheme)));
    });
  }
}
