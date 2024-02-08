import 'package:bloodque/core/shared/domain/entities/measure_entity.dart';

abstract class GetAllMeasuresState{
  const GetAllMeasuresState();
}

class GetAllInitialMeasuresState extends GetAllMeasuresState{
  const GetAllInitialMeasuresState();
}

class GetAllMeasuresLoading extends GetAllMeasuresState{
  const GetAllMeasuresLoading();
}

class GetAllMeasuresStateDone extends GetAllMeasuresState{
  const GetAllMeasuresStateDone({this.measures});
  
  final List<MeasureEntity>? measures;
}
