import 'package:bloodque/core/shared/domain/entities/measure_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'measure_model.g.dart';

@HiveType(typeId: 2)
class MeasureModel extends MeasureEntity{
  const MeasureModel({
    required super.systolic,
    required super.diastolic,
    required super.pulse,
    required super.time,
    required super.date,
  });

  MeasureEntity get measureEntity => MeasureEntity(systolic: systolic, diastolic: diastolic, pulse: pulse, time: time, date: date);
}
