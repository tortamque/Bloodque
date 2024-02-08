// ignore_for_file: prefer_expression_function_bodies

import 'package:bloodque/config/themes/colors.dart';
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
    BlocProvider.of<GetMeasuresBloc>(context).add(GetMeasuresEvent()); 
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMeasuresBloc, GetMeasuresState>(
        builder: (context, state) {
          if (state is GetMeasuresStateDone) {
            return Scaffold(
              appBar: const CustomAppBar(title: 'Blood Pressure BPM Tracker'),
              floatingActionButton: FloatingActionButton(
                backgroundColor: mainColor,
                foregroundColor: Colors.white,
                onPressed: () {
                  print('tapped! :D');
                },
                child: const Icon(Icons.add),
              ),
              body: state.measures == null 
                ? const Center(child: Text('No measures'))
                : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: ListView.builder(
                    itemCount: (state.measures?.length ?? 0) + 1,
                    itemBuilder: (context, index) {
                      if(index == (state.measures?.length ?? 0)){
                        return const AllHistoryButton();
                      }else{
                        final measure = state.measures![index];
                      
                        return MeasureCard(measure: measure);
                      }
                    },
                  ),
                ),
            );
          } else if (state is GetMeasuresLoading) {
            return const Scaffold(
              appBar: CustomAppBar(title: 'Blood Pressure BPM Tracker'),
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return const Scaffold(
            appBar: CustomAppBar(title: 'Blood Pressure BPM Tracker'),
            body: Center(child: Text('Error')),
          );
        },
      );
  }
}
