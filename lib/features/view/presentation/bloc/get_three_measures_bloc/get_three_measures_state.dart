import 'package:bloodque/core/shared/domain/entities/measure_entity.dart';

abstract class GetThreeMeasuresState{
  const GetThreeMeasuresState();
}

class GetThreeInitialMeasuresState extends GetThreeMeasuresState{
  const GetThreeInitialMeasuresState();
}

class GetThreeMeasuresLoading extends GetThreeMeasuresState{
  const GetThreeMeasuresLoading();
}

class GetThreeMeasuresStateDone extends GetThreeMeasuresState{
  const GetThreeMeasuresStateDone({this.measures});
  
  final List<MeasureEntity>? measures;
}
