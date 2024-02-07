import 'package:bloodque/features/indicators_record/presentation/bloc/change_measure_bloc/change_measure_bloc.dart';
import 'package:bloodque/features/indicators_record/presentation/bloc/change_measure_bloc/change_measure_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime _selectedDate = DateTime.now();

  void _pickDate(){
    showDatePicker(
      context: context, 
      initialDate: _selectedDate, 
      firstDate: DateTime(DateTime.now().year - 2),   
      lastDate: DateTime(DateTime.now().year + 1),
    ).then((value) {
      setState(() => _selectedDate = value ?? _selectedDate);

      context.read<ChangeMeasureBloc>().add(ChangeDateMeasureEvent(_selectedDate));
    });
  }

  @override
  Widget build(BuildContext context) => Expanded(
    child: GestureDetector(
      onTap: () => _pickDate(),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Row(
            children: [
              const Icon(Icons.calendar_today),
              const SizedBox(width: 5),
              _DateText(selectedDate: _selectedDate),
            ],
          ),
        ),
      ),
    ),
  );
}

class _DateText extends StatelessWidget {
  const _DateText({required this.selectedDate});

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) => Text(
    DateFormat('dd/MM/yyyy').format(selectedDate),
    style: const TextStyle(
      fontSize: 18,
    ),
  );
}
