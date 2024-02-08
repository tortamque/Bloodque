import 'package:bloodque/config/themes/colors.dart';
import 'package:bloodque/core/shared/domain/entities/measure_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MeasureCard extends StatelessWidget {
  const MeasureCard({super.key, required this.measure});

  final MeasureEntity measure;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 3.5),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.5),
        child: Row(
          children: [
            _MainMeasures(diastolic: measure.diastolic, systolic: measure.systolic),
            const _CustomDivider(),
            _AdditionalInfo(date: measure.date, time: measure.time, pulse: measure.pulse),
          ],
        ),
      ),
    ),
  ); 
}

class _MainMeasures extends StatelessWidget {
  const _MainMeasures({required this.diastolic, required this.systolic});

  final int systolic;
  final int diastolic;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        Text(
          '$systolic',
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '$diastolic',
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) => Container(
    decoration: const BoxDecoration(
      color: greenColor,
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    
    width: 7.5,
    height: MediaQuery.of(context).size.height / 10,
  );
}

class _AdditionalInfo extends StatelessWidget {
  const _AdditionalInfo({required this.date, required this.time, required this.pulse});

  final DateTime date;
  final DateTime time;
  final int pulse;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${time.hour}:${time.minute < 10 ? '0${time.minute}' : time.minute}, ${DateFormat('dd/MM/yyyy').format(date)}',
          style: TextStyle(
            fontSize: 23,
            color: Colors.grey[600],
          ),
        ),
        Text(
          'Pulse: $pulse BPM',
          style: TextStyle(
            fontSize: 23,
            color: Colors.grey[600],
          ),
        ),
      ],
    ),
  );
}
