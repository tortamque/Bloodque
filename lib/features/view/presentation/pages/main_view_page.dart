
import 'package:bloodque/config/themes/colors.dart';
import 'package:bloodque/core/constants/navigator_constants.dart';
import 'package:bloodque/core/shared/domain/entities/measure_entity.dart';
import 'package:bloodque/core/shared/presentation/widgets/custom_app_bar.dart';
import 'package:bloodque/features/view/presentation/bloc/get_three_measures_bloc/get_three_measures_bloc.dart';
import 'package:bloodque/features/view/presentation/bloc/get_three_measures_bloc/get_three_measures_event.dart';
import 'package:bloodque/features/view/presentation/bloc/get_three_measures_bloc/get_three_measures_state.dart';
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
    BlocProvider.of<GetThreeMeasuresBloc>(context).add(GetThreeMeasuresEvent()); 
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<GetThreeMeasuresBloc, GetThreeMeasuresState>(
    builder: (context, state) => Scaffold(
      appBar: const CustomAppBar(title: 'Blood Pressure BPM Tracker'),
      floatingActionButton: const _FloatingActionButton(),
      body: _buildBody(state),
    ),
  );

  Widget _buildBody(GetThreeMeasuresState state) {
    if (state is GetThreeMeasuresStateDone) {
      return state.measures == null
        ? const Center(child: Text("Can't find your measures, try adding some! 😊"))
        : _PageContent(measures: state.measures!);
    } else if (state is GetThreeMeasuresLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return const Center(child: Text('An error occurred 😔'));
    }
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) => FloatingActionButton(
      backgroundColor: mainColor,
      foregroundColor: Colors.white,
      onPressed: () {
        Navigator.pushNamed(context, recordPageConstant).then(
          (value) => BlocProvider.of<GetThreeMeasuresBloc>(context).add(GetThreeMeasuresEvent())
        );
      },
      child: const Icon(Icons.add),
    );
}

class _PageContent extends StatelessWidget {
  const _PageContent({required this.measures});

  final List<MeasureEntity>? measures;

  @override
  Widget build(BuildContext context) => Padding(
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
