import 'package:flutter/material.dart';

abstract class ChangeMeasureEvent {
  const ChangeMeasureEvent();
}

class ChangeSystolicMeasureEvent extends ChangeMeasureEvent {
  ChangeSystolicMeasureEvent(this.systolic);

  final int systolic;
}

class ChangeDiastolicMeasureEvent extends ChangeMeasureEvent {
  ChangeDiastolicMeasureEvent(this.diastolic);

  final int diastolic;
}

class ChangePulseMeasureEvent extends ChangeMeasureEvent {
  ChangePulseMeasureEvent(this.pulse);

  final int pulse;
}

class ChangeDateMeasureEvent extends ChangeMeasureEvent {
  ChangeDateMeasureEvent(this.date);

  final DateTime date;
}

class ChangeTimeMeasureEvent extends ChangeMeasureEvent {
  ChangeTimeMeasureEvent(this.time);

  final TimeOfDay time;
}
