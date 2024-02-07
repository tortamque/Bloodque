import 'package:bloodque/features/indicators_record/presentation/bloc/change_measure_bloc/change_measure_bloc.dart';
import 'package:bloodque/features/indicators_record/presentation/bloc/change_measure_bloc/change_measure_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({super.key});

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  void _pickTime() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() => _selectedTime = value ?? _selectedTime);

      context.read<ChangeMeasureBloc>().add(ChangeTimeMeasureEvent(_selectedTime));
    });
  }

  @override
  Widget build(BuildContext context) => Expanded(
    child: GestureDetector(
      onTap: () => _pickTime(),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Row(
            children: [
              const Icon(Icons.access_time),
              const SizedBox(width: 5),
              _TimeText(selectedDate: _selectedTime),
            ],
          ),
        ),
      ),
    ),
  );
}

class _TimeText extends StatelessWidget {
  const _TimeText({required this.selectedDate});

  final TimeOfDay selectedDate;

  @override
  Widget build(BuildContext context) => Text(
    DateFormat('HH:mm').format(
      DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        selectedDate.hour,
        selectedDate.minute,
      ),
    ),
    style: const TextStyle(
      fontSize: 18,
    ),
  );
}
