// ignore_for_file: prefer_expression_function_bodies

import 'package:bloodque/config/themes/colors.dart';
import 'package:bloodque/core/shared/domain/entities/measure_entity.dart';
import 'package:bloodque/core/shared/presentation/widgets/custom_app_bar.dart';
import 'package:bloodque/features/view/presentation/bloc/get_measures_bloc/get_measures_bloc.dart';
import 'package:bloodque/features/view/presentation/bloc/get_measures_bloc/get_measures_event.dart';
import 'package:bloodque/features/view/presentation/bloc/get_measures_bloc/get_measures_state.dart';
import 'package:bloodque/features/view/presentation/widgets/all_history_button.dart';
import 'package:bloodque/features/view/presentation/widgets/measure_card.dart';
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
    BlocProvider.of<GetMeasuresBloc>(context).add(GetThreeMeasuresEvent()); 
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMeasuresBloc, GetMeasuresState>(
        builder: (context, state) {
          if (state is GetThreeMeasuresStateDone) {
            return Scaffold(
              appBar: const CustomAppBar(title: 'Blood Pressure BPM Tracker'),
              floatingActionButton: const _FloatingActionButton(),
              body: state.measures == null 
                ? const Center(child: Text('No measures'))
                : _PageContent(measures: state.measures!),
            );
          } else if (state is GetThreeMeasuresLoading) {
            return const Scaffold(
              appBar: CustomAppBar(title: 'Blood Pressure BPM Tracker'),
              floatingActionButton: _FloatingActionButton(),
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return const Scaffold(
            appBar: CustomAppBar(title: 'Blood Pressure BPM Tracker'),
            floatingActionButton: _FloatingActionButton(),
            body: Center(child: Text('Error')),
          );
        },
      );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: mainColor,
      foregroundColor: Colors.white,
      onPressed: () {
        print('tapped! :D');
      },
      child: const Icon(Icons.add),
    );
  }
}

class _PageContent extends StatelessWidget {
  const _PageContent({required this.measures});

  final List<MeasureEntity>? measures;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: ListView.builder(
        itemCount: (measures?.length ?? 0) + 1,
        itemBuilder: (context, index) {
          if(index == (measures?.length ?? 0)){
            return const AllHistoryButton();
          }else{
            final measure = measures![index];
          
            return MeasureCard(measure: measure);
          }
        },
      ),
    );
  }
}
