import 'package:bloodque/core/shared/presentation/widgets/custom_app_bar.dart';
import 'package:bloodque/features/indicators_record/presentation/widgets/date_picker/custom_date_picker.dart';
import 'package:bloodque/features/indicators_record/presentation/widgets/record_picker/record_picker.dart';
import 'package:bloodque/features/indicators_record/presentation/widgets/save_button/save_button.dart';
import 'package:bloodque/features/indicators_record/presentation/widgets/time_picker/custom_time_picker.dart';
import 'package:flutter/material.dart';

class IndicatorsRecordPage extends StatelessWidget {
  const IndicatorsRecordPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: CustomAppBar(title: 'New Record'),
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _RecordPickers(),
          _DateText(),
          _DateAndTimePickers(),
          Spacer(),
          SaveButton(),
        ],
      ),
    ),
  );
}

class _RecordPickers extends StatelessWidget {
  const _RecordPickers();

  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(vertical: 15),
    child: Row(
      children: [
        RecordPicker(
          title: 'Systolic',
          measureUnit: 'mmHg',
          minValue: 70,
          maxValue: 160,
          initialValue: 100,
        ),
        RecordPicker(
          title: 'Diastolic',
          measureUnit: 'mmHg',
          minValue: 60,
          maxValue: 90,
          initialValue: 78,
        ),
        RecordPicker(
          title: 'Pulse',
          measureUnit: 'BPM',
          minValue: 50,
          maxValue: 200,
          initialValue: 80,
        ),
      ],
    ),
  );
}

class _DateText extends StatelessWidget {
  const _DateText();

  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Date & Time',
        style: TextStyle(
          color: Colors.black,
          fontSize: 27,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

class _DateAndTimePickers extends StatelessWidget {
  const _DateAndTimePickers();

  @override
  Widget build(BuildContext context) => const Row(
    children: [
      CustomDatePicker(),
      CustomTimePicker(),
    ],
  );
}
