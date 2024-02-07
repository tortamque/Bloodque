import 'package:bloodque/core/shared/domain/repository/measures_repository.dart';
import 'package:bloodque/core/usecases/usecase.dart';
import 'package:bloodque/features/indicators_record/domain/usecases/save_measure/save_measure_params.dart';

class SaveMeasureUseCase implements UseCase<void, SaveMeasureParams>{
  SaveMeasureUseCase(this._repository);

  final MeasuresRepository _repository;

  @override
  Future<void> call({SaveMeasureParams? params}) async{
    if(params != null){
      await _repository.saveMeasure(params.measure);
    }
  }
}
