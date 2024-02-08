import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'measure_entity.g.dart';

@HiveType(typeId: 1)
class MeasureEntity extends Equatable {
  const MeasureEntity({required this.systolic, required this.diastolic, required this.pulse, required this.time, required this.date});

  @HiveField(0)
  final int systolic;
  @HiveField(1)
  final int diastolic;
  @HiveField(2)
  final int pulse;
  @HiveField(3)
  final DateTime time;
  @HiveField(4)
  final DateTime date;
  
  @override
  List<Object?> get props => [systolic, diastolic, pulse, time, date];
}
