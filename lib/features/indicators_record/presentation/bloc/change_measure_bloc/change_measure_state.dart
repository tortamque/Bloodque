import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ChangeMeasureState extends Equatable {
  const ChangeMeasureState({required this.systolic, required this.diastolic, required this.pulse, required this.date, required this.time});

  final int systolic;
  final int diastolic;
  final int pulse;
  final DateTime date;
  final TimeOfDay time;

  ChangeMeasureState copyWith({
    int? systolic,
    int? diastolic,
    int? pulse,
    DateTime? date,
    TimeOfDay? time,
  }) => ChangeMeasureState(
    systolic: systolic ?? this.systolic,
    diastolic: diastolic ?? this.diastolic,
    pulse: pulse ?? this.pulse,
    date: date ?? this.date,
    time: time ?? this.time,
  );

  @override
  List<Object> get props => [systolic, diastolic, pulse, date, time];
}
