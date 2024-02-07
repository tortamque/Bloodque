import 'package:bloodque/core/constants/hive_constants.dart';
import 'package:bloodque/core/shared/data/models/measure_model.dart';
import 'package:bloodque/core/shared/domain/entities/measure_entity.dart';
import 'package:bloodque/core/shared/domain/repository/measures_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MeasuresRepositoryImpl implements MeasuresRepository{
  @override
  Future<void> saveMeasure(MeasureEntity measure, Box<dynamic> box) async{
    final measures = getMeasures(box) ?? <MeasureEntity>[];

    measures.add(measure);

    await box.put(hiveMeasuresKey, measures);
  }
  
  @override
  List<MeasureModel>? getMeasures(Box<dynamic> box) => box.get(hiveMeasuresKey);
}
