import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:turbosoft/core/failures/failures.dart';
import 'package:turbosoft/feature/data/models/gold_rate_model/gold_rate_model.dart';
import 'package:turbosoft/feature/data/repos/abstractrepos.dart';

part 'goldrate_event.dart';
part 'goldrate_state.dart';
part 'goldrate_bloc.freezed.dart';

@injectable
class GoldrateBloc extends Bloc<GoldrateEvent, GoldrateState> {
  final IGoldRateRepo goldRateRepo;
  GoldrateBloc(this.goldRateRepo) : super(GoldrateState.initial()) {
    on<GetgoldRateEvent>((event, emit) async {
      Either<MainFailures, GoldRateModel> goldrate =
          await goldRateRepo.getGoldrate(event.datakey);

      emit(goldrate.fold(
          (l) => const FailedState(), (r) => Goldratestate(goldrate: r)));
    });
  }
}
