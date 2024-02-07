// ignore_for_file: prefer_expression_function_bodies

import 'package:bloodque/core/shared/presentation/bloc/measures_bloc.dart';
import 'package:bloodque/core/shared/presentation/bloc/measures_state.dart';
import 'package:bloodque/core/shared/presentation/widgets/custom_app_bar.dart';
import 'package:bloodque/features/view/presentation/bloc/get_measures_bloc/get_measures_event.dart';
import 'package:bloodque/features/view/presentation/bloc/get_measures_bloc/get_measures_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewPage extends StatefulWidget {
  const MainViewPage({super.key});

  @override
  State<MainViewPage> createState() => _MainViewPageState();
}

class _MainViewPageState extends State<MainViewPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MeasuresBloc>(context).add(GetMeasuresEvent()); 
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeasuresBloc, MeasuresState>(
      builder: (context, state) {
        if (state is MeasuresLoading) {
          return const Scaffold(
            appBar: CustomAppBar(title: 'Blood Pressure BPM Tracker'),
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is GetMeasuresState) {
          return Scaffold(
            appBar: const CustomAppBar(title: 'Blood Pressure BPM Tracker'),
            body: ListView.builder(
              itemCount: state.measures?.length ?? 0,
              itemBuilder: (context, index) {
                final measure = state.measures?[index];

                return ListTile(
                  title: Text(measure?.systolic.toString() ?? ''),
                  subtitle: Text(measure?.diastolic.toString() ?? ''),
                );
              },
            ),
          );
        } else {
          return const Scaffold(
            appBar: CustomAppBar(title: 'Blood Pressure BPM Tracker'),
            body: Center(child: Text('No measures')),
          );
        }
      },
    );
  }
}
