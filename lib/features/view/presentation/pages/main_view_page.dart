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
    BlocProvider.of<MeasuresBloc>(context).add(GetMeasuresEvent()); // Add the Bloc event in initState
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<MeasuresBloc, MeasuresState>(
    builder: (context, state) {
      if(state is GetMeasuresState){
        print(state.measures?.length ?? 0);
        return Scaffold(
          appBar: const CustomAppBar(title: 'Blood Pressure BPM Tracker'),
          body: Container(),
        );
      }
      return Placeholder();
    },
  );
}
