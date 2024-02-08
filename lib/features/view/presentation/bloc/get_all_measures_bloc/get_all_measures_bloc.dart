// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloodque/features/view/domain/usecases/get_measures_usecase.dart';
import 'package:bloodque/features/view/presentation/bloc/get_all_measures_bloc/get_all_measures_event.dart';
import 'package:bloodque/features/view/presentation/bloc/get_all_measures_bloc/get_all_measures_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllMeasuresBloc extends Bloc<GetAllMeasuresEvent, GetAllMeasuresState> {
  GetAllMeasuresBloc(this._getMeasuresUseCase) : super(const GetAllInitialMeasuresState()) {
    on<GetAllMeasuresEvent>(_getMeasures);
  }

  final GetMeasuresUseCase _getMeasuresUseCase;

  void _getMeasures(GetAllMeasuresEvent event, Emitter<GetAllMeasuresState> emitter) {
    emit(const GetAllMeasuresLoading());

    final measures = _getMeasuresUseCase()?.
    map(
      (measureModel) => measureModel.measureEntity,
    ).toList();

    emit(GetAllMeasuresStateDone(measures: measures));
  }
}
