// ignore_for_file: prefer_expression_function_bodies

import 'package:bloodque/config/themes/colors.dart';
import 'package:bloodque/core/shared/presentation/widgets/custom_app_bar.dart';
import 'package:bloodque/features/view/presentation/bloc/get_measures_bloc/get_measures_bloc.dart';
import 'package:bloodque/features/view/presentation/bloc/get_measures_bloc/get_measures_event.dart';
import 'package:bloodque/features/view/presentation/bloc/get_measures_bloc/get_measures_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
          if (state is GetMeasuresLoading) {
            return const Scaffold(
              appBar: CustomAppBar(title: 'Blood Pressure BPM Tracker'),
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is GetMeasuresStateDone) {
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
              body: ListView.builder(
                itemCount: state.measures?.length ?? 0,
                itemBuilder: (context, index) {
                  final measure = state.measures?[index];
    
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.5),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7.5),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Text(
                                    '${measure!.systolic}',
                                    style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${measure.diastolic}',
                                    style: const TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]
                              ),
                            ),
                      
                            Container(
                              decoration: const BoxDecoration(
                                color: greenColor,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              
                              width: 7.5,
                              height: MediaQuery.of(context).size.height / 10,
                            ),
                  
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${measure.time.hour}:${measure.time.minute < 10 ? '0${measure.time.minute}' : measure.time.minute}, ${DateFormat('dd/MM/yyyy').format(measure.date)}',
                                    style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.grey[600]
                                    ),
                                  ),
                                  Text(
                                    'Pulse: ${measure.pulse} BPM',
                                    style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.grey[600]
                                    )
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
