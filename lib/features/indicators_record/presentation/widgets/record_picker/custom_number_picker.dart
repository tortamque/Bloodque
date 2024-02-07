import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class CustomNumberPicker extends StatefulWidget {
  const CustomNumberPicker({super.key, required this.minValue, required this.maxValue, required this.initialValue});

  final int minValue;
  final int maxValue;
  final int initialValue;

  @override
  State<CustomNumberPicker> createState() => _CustomNumberPickerState();
}

class _CustomNumberPickerState extends State<CustomNumberPicker> {
  int _currentValue = 0;

  @override
  void initState() {
    super.initState();

    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: NumberPicker(
      value: _currentValue,
      minValue: widget.minValue,
      maxValue: widget.maxValue,
      onChanged: (value) => setState(() => _currentValue = value),
      selectedTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      textStyle: TextStyle(
        color: Colors.grey[400],
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
          ),
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    ),
  );
}
