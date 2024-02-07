import 'package:bloodque/core/shared/domain/entities/measure_entity.dart';
import 'package:bloodque/core/shared/presentation/bloc/measures_event.dart';

class SaveMeasureEvent extends MeasuresEvent{
  SaveMeasureEvent({required this.measure});

  final MeasureEntity measure;
}
