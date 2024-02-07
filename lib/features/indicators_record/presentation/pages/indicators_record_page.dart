import 'package:bloodque/core/shared/presentation/widgets/custom_app_bar.dart';
import 'package:bloodque/features/indicators_record/presentation/widgets/record_picker/record_picker.dart';
import 'package:flutter/material.dart';

class IndicatorsRecordPage extends StatelessWidget {
  const IndicatorsRecordPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'New Record'),
    body: Column(
      children: [
        _RecordPickers(),
      ],
    )
  );
}

class _RecordPickers extends StatelessWidget {
  const _RecordPickers();

  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
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
