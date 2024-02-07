import 'package:bloodque/features/indicators_record/presentation/widgets/record_picker/custom_number_picker.dart';
import 'package:flutter/material.dart';

class RecordPicker extends StatelessWidget {
  const RecordPicker({super.key, required this.title, required this.measureUnit, required this.minValue, required this.maxValue, required this.initialValue, required this.onChanged});

  final String title;
  final String measureUnit;
  final int minValue;
  final int maxValue;
  final int initialValue;
  final void Function(int value) onChanged;

  @override
  Widget build(BuildContext context) => Expanded(
    child: SizedBox(
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            _Title(title: title),
            _MeasureUnit(measureUnit: measureUnit),
            CustomNumberPicker(
              minValue: minValue, 
              maxValue: maxValue, 
              initialValue: initialValue,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    ),
  );
}

class _Title extends StatelessWidget {
  const _Title({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => Text(
    title,
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

//create meaure unit widget
class _MeasureUnit extends StatelessWidget {
  const _MeasureUnit({required this.measureUnit});

  final String measureUnit;

  @override
  Widget build(BuildContext context) => Text(
    '($measureUnit)',
    style: const TextStyle(
      fontSize: 15,
      color: Colors.grey,
    ),
  );
}
