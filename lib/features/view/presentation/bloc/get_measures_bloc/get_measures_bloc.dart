// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloodque/features/view/domain/usecases/get_measures_usecase.dart';
import 'package:bloodque/features/view/presentation/bloc/get_measures_bloc/get_measures_event.dart';
import 'package:bloodque/features/view/presentation/bloc/get_measures_bloc/get_measures_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetMeasuresBloc extends Bloc<GetMeasuresEvent, GetMeasuresState> {
  GetMeasuresBloc(this._getMeasuresUseCase) : super(const GetInitialMeasuresState()) {
    on<GetMeasuresEvent>(_getMeasures);
  }
  final GetMeasuresUseCase _getMeasuresUseCase;

  void _getMeasures(GetMeasuresEvent event, Emitter<GetMeasuresState> emitter) {
    emit(const GetMeasuresLoading());

    final measures = _getMeasuresUseCase()?.
    map(
      (measureModel) => measureModel.measureEntity,
    ).toList();

    emit(GetMeasuresStateDone(measures: measures));
  }
}