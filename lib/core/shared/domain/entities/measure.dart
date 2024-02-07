import 'package:equatable/equatable.dart';

class Measure extends Equatable {
  Measure({required this.systolic, required this.diastolic, required this.pulse, required this.time, required this.date});

  final int systolic;
  final int diastolic;
  final int pulse;
  final DateTime time;
  final DateTime date;
  
  @override
  List<Object?> get props => [systolic, diastolic, pulse, time, date];
}
