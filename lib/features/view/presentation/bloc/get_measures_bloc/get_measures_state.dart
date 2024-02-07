import 'package:bloodque/core/shared/domain/entities/measure_entity.dart';
import 'package:bloodque/core/shared/presentation/bloc/measures_state.dart';

class GetMeasuresState extends MeasuresState{
  const GetMeasuresState({this.measures});
  
  final List<MeasureEntity>? measures;
}
