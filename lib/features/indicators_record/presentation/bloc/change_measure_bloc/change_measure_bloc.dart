import 'package:bloodque/features/indicators_record/presentation/bloc/change_measure_bloc/change_measure_event.dart';
import 'package:bloodque/features/indicators_record/presentation/bloc/change_measure_bloc/change_measure_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeMeasureBloc extends Bloc<ChangeMeasureEvent, ChangeMeasureState> {
  ChangeMeasureBloc() : super(
    ChangeMeasureState(
      systolic: 100,
      diastolic: 78,
      pulse: 80,
      date: DateTime.now(),
      time: TimeOfDay.now(),
    ),
  ) {
    on<ChangeSystolicMeasureEvent>(_changeSystolicMeasure);
    on<ChangeDiastolicMeasureEvent>(_changeDiastolicMeasure);
    on<ChangePulseMeasureEvent>(_changePulseMeasure);
    on<ChangeDateMeasureEvent>(_changeDateMeasure);
    on<ChangeTimeMeasureEvent>(_changeTimeMeasure);
  }

  void _changeSystolicMeasure(ChangeSystolicMeasureEvent event, Emitter<ChangeMeasureState> emit) {
    emit(state.copyWith(systolic: event.systolic));
  }

  void _changeDiastolicMeasure(ChangeDiastolicMeasureEvent event, Emitter<ChangeMeasureState> emit) {
    emit(state.copyWith(diastolic: event.diastolic));
  }

  void _changePulseMeasure(ChangePulseMeasureEvent event, Emitter<ChangeMeasureState> emit) {
    emit(state.copyWith(pulse: event.pulse));
  }

  void _changeDateMeasure(ChangeDateMeasureEvent event, Emitter<ChangeMeasureState> emit) {
    emit(state.copyWith(date: event.date));
  }

  void _changeTimeMeasure(ChangeTimeMeasureEvent event, Emitter<ChangeMeasureState> emit) {
    emit(state.copyWith(time: event.time));
  }
}
