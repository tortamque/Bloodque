import 'package:bloodque/core/shared/data/models/measure_model.dart';
import 'package:bloodque/core/shared/domain/repository/measures_repository.dart';
import 'package:bloodque/core/usecases/usecase.dart';

class GetMeasuresUseCase implements UseCase<List<MeasureModel>?, void>{
  GetMeasuresUseCase(this._repository);

  final MeasuresRepository _repository;

  @override
  List<MeasureModel>? call({void params}) => _repository.getMeasures();
}
