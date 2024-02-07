import 'package:bloodque/config/themes/app_theme.dart';
import 'package:bloodque/config/themes/colors.dart';
import 'package:bloodque/features/indicators_record/presentation/pages/indicators_record_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  runApp(const BloodqueApp());
}

class BloodqueApp extends StatelessWidget {
  const BloodqueApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: theme(mainColor),
      home: const IndicatorsRecordPage(),
    );
}
