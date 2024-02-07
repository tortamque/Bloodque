// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloodque/core/shared/presentation/bloc/measures_event.dart';
import 'package:bloodque/core/shared/presentation/bloc/measures_state.dart';
import 'package:bloodque/features/indicators_record/domain/usecases/save_measure/save_measure_params.dart';
import 'package:bloodque/features/indicators_record/domain/usecases/save_measure/save_measure_usecase.dart';
import 'package:bloodque/features/indicators_record/presentation/bloc/save_measure_bloc/save_measure_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeasuresBloc extends Bloc<MeasuresEvent, MeasuresState> {
  MeasuresBloc(this._saveMeasureUseCase) : super(const InitialMeasuresState()) {
    on<SaveMeasureEvent>(_saveMeasure);
  }

  final SaveMeasureUseCase _saveMeasureUseCase;

  Future<void> _saveMeasure(SaveMeasureEvent event, Emitter<MeasuresState> emitter) async {
    emit(const MeasuresLoading());

    await _saveMeasureUseCase(
      params: SaveMeasureParams(
          event.measure,
      ),
    );

    emit(const MeasuresSaveDone());
  }
}
