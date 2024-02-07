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
  List<MeasureModel>? getMeasures() => _box.get(hiveMeasuresKey, defaultValue: [])?.cast<MeasureModel>();
  
  @override
  Future<void> saveMeasure(MeasureEntity measure) async{
    final measures = getMeasures() ?? <MeasureModel>[];

    measures.add(
      MeasureModel(
        systolic: measure.systolic,
        diastolic: measure.diastolic,
        pulse: measure.pulse,
        time: measure.time,
        date: measure.date,
      ),
    );

    await _box.put(hiveMeasuresKey, measures);
  }
}
