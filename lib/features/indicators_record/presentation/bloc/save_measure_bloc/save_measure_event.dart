import 'package:bloodque/core/shared/domain/entities/measure_entity.dart';


class SaveMeasureEvent{
  SaveMeasureEvent({required this.measure});

  final MeasureEntity measure;
}
