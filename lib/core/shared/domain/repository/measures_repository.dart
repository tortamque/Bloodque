import 'package:bloodque/core/shared/data/models/measure_model.dart';
import 'package:bloodque/core/shared/domain/entities/measure_entity.dart';
import 'package:hive/hive.dart';

abstract class MeasuresRepository{
  Future<void> saveMeasure(MeasureEntity measure, Box<dynamic> box);
  List<MeasureModel>? getMeasures(Box<dynamic> box);
}
