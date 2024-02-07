import 'package:bloodque/core/shared/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class IndicatorsRecordPage extends StatelessWidget {
  const IndicatorsRecordPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: CustomAppBar(title: 'New Record'),
    body: Center(
      child: Text('Indicators Record Page'),
    ),
  );
}
