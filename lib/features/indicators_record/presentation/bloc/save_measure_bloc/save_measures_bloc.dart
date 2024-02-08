// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloodque/features/indicators_record/domain/usecases/save_measure/save_measure_params.dart';
import 'package:bloodque/features/indicators_record/domain/usecases/save_measure/save_measure_usecase.dart';
import 'package:bloodque/features/indicators_record/presentation/bloc/save_measure_bloc/save_measure_event.dart';
import 'package:bloodque/features/indicators_record/presentation/bloc/save_measure_bloc/save_measures_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveMeasuresBloc extends Bloc<SaveMeasureEvent, SaveMeasuresState> {
  SaveMeasuresBloc(this._saveMeasureUseCase) : super(const SaveInitialMeasuresState()) {
    on<SaveMeasureEvent>(_saveMeasure);
  }

  final SaveMeasureUseCase _saveMeasureUseCase;

  Future<void> _saveMeasure(SaveMeasureEvent event, Emitter<SaveMeasuresState> emitter) async {
    emit(const SaveMeasuresLoading());

    await _saveMeasureUseCase(
      params: SaveMeasureParams(
          event.measure,
      ),
    );

    emit(const SaveMeasuresDone());
  }
}
