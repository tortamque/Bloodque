import 'package:bloodque/core/shared/domain/entities/measure_entity.dart';

abstract class GetMeasuresState{
  const GetMeasuresState();
}

class GetInitialMeasuresState extends GetMeasuresState{
  const GetInitialMeasuresState();
}

class GetMeasuresLoading extends GetMeasuresState{
  const GetMeasuresLoading();
}

class GetMeasuresStateDone extends GetMeasuresState{
  const GetMeasuresStateDone({this.measures});
  
  final List<MeasureEntity>? measures;
}

class GetThreeMeasuresLoading extends GetMeasuresState{
  const GetThreeMeasuresLoading();
}

class GetThreeMeasuresStateDone extends GetMeasuresState{
  const GetThreeMeasuresStateDone({this.measures});
  
  final List<MeasureEntity>? measures;
}
