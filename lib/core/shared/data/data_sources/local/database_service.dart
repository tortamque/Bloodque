import 'package:bloodque/core/constants/hive_constants.dart';
import 'package:bloodque/core/shared/data/models/measure_model.dart';
import 'package:bloodque/core/shared/domain/entities/measure_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class DatabaseService{
  Future<void> saveMeasure(MeasureEntity measure);
    
  List<MeasureModel>? getMeasures();
}

class DatabaseServiceImpl implements DatabaseService{
  DatabaseServiceImpl(this._box);

  final Box<dynamic> _box;
  
  @override
  List<MeasureModel>? getMeasures() => _box.get(hiveMeasuresKey);
  
  @override
  Future<void> saveMeasure(MeasureEntity measure) async{
    final measures = getMeasures()?.map(
      (model) => model.measureEntity,
    ).toList() ?? <MeasureEntity>[];

    measures.add(measure);

    await _box.put(hiveMeasuresKey, measures);
  }
}
