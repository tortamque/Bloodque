import 'package:bloodque/core/shared/data/models/measure_model.dart';
import 'package:bloodque/core/shared/domain/entities/measure_entity.dart';

abstract class MeasuresRepository{
  Future<void> saveMeasure(MeasureEntity measure);
  List<MeasureModel>? getMeasures();
  List<MeasureModel>? getThreeMeasures();
}
