import 'package:bloodque/core/shared/domain/entities/measure_entity.dart';
import 'package:bloodque/core/shared/presentation/widgets/custom_app_bar.dart';
import 'package:bloodque/features/view/presentation/bloc/get_all_measures_bloc/get_all_measures_bloc.dart';
import 'package:bloodque/features/view/presentation/bloc/get_all_measures_bloc/get_all_measures_event.dart';
import 'package:bloodque/features/view/presentation/bloc/get_all_measures_bloc/get_all_measures_state.dart';
import 'package:bloodque/features/view/presentation/widgets/measure_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailedViewPage extends StatefulWidget {
  const DetailedViewPage({super.key});

  @override
  State<DetailedViewPage> createState() => _DetailedViewPageState();
}

class _DetailedViewPageState extends State<DetailedViewPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAllMeasuresBloc>(context).add(GetAllMeasuresEvent()); 
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: const CustomAppBar(title: 'History'),
      body: BlocBuilder<GetAllMeasuresBloc, GetAllMeasuresState>(
        builder: (context, state) => _buildBody(state),
      ),
    );

  Widget _buildBody(GetAllMeasuresState state) {
    if (state is GetAllMeasuresStateDone) {
      return state.measures == null
          ? const Center(child: Text("Can't find any measures."))
          : _PageContent(measures: state.measures!); 
    } else if (state is GetAllMeasuresLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return const Center(child: Text('Error'));
    }
  }
}

class _PageContent extends StatelessWidget {
  const _PageContent({required this.measures});

  final List<MeasureEntity>? measures;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: ListView.builder(
        itemCount: measures?.length ?? 0,
        itemBuilder: (context, index) {
          final measure = measures![index];
        
          return MeasureCard(measure: measure);
        },
      ),
    );
}
