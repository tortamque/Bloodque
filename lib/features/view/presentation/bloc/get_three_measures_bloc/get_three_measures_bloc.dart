// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloodque/features/view/domain/usecases/get_three_measures_usecase.dart';
import 'package:bloodque/features/view/presentation/bloc/get_three_measures_bloc/get_three_measures_event.dart';
import 'package:bloodque/features/view/presentation/bloc/get_three_measures_bloc/get_three_measures_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetThreeMeasuresBloc extends Bloc<GetThreeMeasuresEvent, GetThreeMeasuresState> {
  GetThreeMeasuresBloc(this._getThreeMeasuresUseCase) : super(const GetThreeInitialMeasuresState()) {
    on<GetThreeMeasuresEvent>(_getThreeMeasures);
  }

  final GetThreeMeasuresUseCase _getThreeMeasuresUseCase;

  void _getThreeMeasures(GetThreeMeasuresEvent event, Emitter<GetThreeMeasuresState> emitter){
    emit(const GetThreeMeasuresLoading());

    final measures = _getThreeMeasuresUseCase()?.
    map(
      (measureModel) => measureModel.measureEntity,
    ).toList();

    emit(GetThreeMeasuresStateDone(measures: measures));
  }
}
