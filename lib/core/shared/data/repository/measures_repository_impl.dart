import 'package:bloodque/core/shared/data/data_sources/local/database_service.dart';
import 'package:bloodque/core/shared/data/models/measure_model.dart';
import 'package:bloodque/core/shared/domain/entities/measure_entity.dart';
import 'package:bloodque/core/shared/domain/repository/measures_repository.dart';

class MeasuresRepositoryImpl implements MeasuresRepository{
  MeasuresRepositoryImpl(this._databaseService);

  final DatabaseService _databaseService;

  @override
  Future<void> saveMeasure(MeasureEntity measure) async => _databaseService.saveMeasure(measure);
  
  @override
  List<MeasureModel>? getMeasures() => _databaseService.getMeasures();
}
